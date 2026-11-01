#!/bin/bash

# Title: AMD ROCm diagnostics for ComfyUI-Easy-Install
# Checks the kernel driver, device permissions, ROCm runtime and the
# PyTorch HIP stack. Read-only: nothing is installed or changed.

cd "$(dirname "$0")/.." 2>/dev/null || cd "$(dirname "$0")"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

ok()   { echo -e "  ${GREEN}✓${RESET} $*"; }
warn() { echo -e "  ${YELLOW}!${RESET} $*"; }
bad()  { echo -e "  ${RED}✗${RESET} $*"; }
section() { echo ""; echo -e "${CYAN}${BOLD}== $* ==${RESET}"; }

FAIL=0
note_fail() { FAIL=$((FAIL + 1)); }

section "System"
ok "Kernel: $(uname -r)"
ok "Distribution: $(. /etc/os-release 2>/dev/null && echo "$PRETTY_NAME" || echo unknown)"
if [ -f /sys/module/amdgpu/version ]; then
    ok "amdgpu driver: $(cat /sys/module/amdgpu/version)"
else
    warn "amdgpu module version not exposed by this kernel"
fi

section "GPU"
if command -v lspci >/dev/null 2>&1; then
    lspci 2>/dev/null | grep -iE 'VGA compatible controller|Display controller' | while read -r line; do
        echo -e "  ${YELLOW}${line}${RESET}"
    done
fi

DRM_DEV=""
for card in /sys/class/drm/card[0-9]*/device; do
    [ -r "$card/vendor" ] || continue
    if [ "$(cat "$card/vendor" 2>/dev/null)" = "0x1002" ]; then
        DRM_DEV="$card"
        break
    fi
done

if [ -n "$DRM_DEV" ]; then
    ok "DRM device: ${DRM_DEV}"
    ok "PCI ID: $(cat "$DRM_DEV/vendor" 2>/dev/null):$(cat "$DRM_DEV/device" 2>/dev/null)"
    vram=$(cat "$DRM_DEV/mem_info_vram_total" 2>/dev/null || echo 0)
    gtt=$(cat "$DRM_DEV/mem_info_gtt_total" 2>/dev/null || echo 0)
    ok "VRAM carve-out: $((vram / 1073741824)) GiB"
    ok "GTT (shared) memory: $((gtt / 1073741824)) GiB"
else
    bad "No AMD DRM device found (is amdgpu loaded?)"
    note_fail
fi

section "Device permissions"
if [ -e /dev/kfd ]; then
    ok "/dev/kfd exists: $(ls -l /dev/kfd)"
    if [ -r /dev/kfd ] && [ -w /dev/kfd ]; then
        ok "/dev/kfd is readable/writable by $USER"
    else
        bad "/dev/kfd is not accessible by $USER"
        warn "Add your user to the render group: sudo usermod -aG render,video \$USER"
        note_fail
    fi
else
    bad "/dev/kfd is missing"
    warn "Check that the amdgpu kernel driver is loaded: lsmod | grep amdgpu"
    note_fail
fi

RENDER_NODE=$(ls /dev/dri/renderD* 2>/dev/null | head -n1)
if [ -n "$RENDER_NODE" ]; then
    ok "Render node: $(ls -l "$RENDER_NODE")"
    if [ -r "$RENDER_NODE" ] && [ -w "$RENDER_NODE" ]; then
        ok "$RENDER_NODE is accessible"
    else
        bad "$RENDER_NODE is not accessible by $USER"
        note_fail
    fi
else
    bad "No /dev/dri/renderD* node found"
    note_fail
fi

echo "  Groups: $(id -nG)"
if id -nG | tr ' ' '\n' | grep -qx render; then
    ok "User is in the render group"
else
    bad "User is NOT in the render group"
    warn "sudo usermod -aG render,video \$USER  (then log out/in)"
    note_fail
fi

section "ROCm runtime (optional)"
if command -v rocminfo >/dev/null 2>&1; then
    ok "rocminfo found: $(command -v rocminfo)"
    rocminfo 2>/dev/null | grep -oE 'gfx[0-9a-f]+' | sort -u | while read -r arch; do
        ok "Agent target: ${arch}"
    done
else
    warn "rocminfo is not installed (not required: PyTorch wheels bundle ROCm)"
    warn "Arch: sudo pacman -S rocminfo   Ubuntu: sudo apt install rocminfo"
fi
if [ -d /opt/rocm ]; then
    ok "/opt/rocm present: $(cat /opt/rocm/.info/version 2>/dev/null || echo 'version unknown')"
else
    warn "/opt/rocm not present (fine for the bundled PyTorch wheels; needed to build HIP llama.cpp)"
fi

section "PyTorch / HIP"
PYTHON=""
for candidate in ./python_embeded/python ./python_embeded/bin/python3 ./python_embeded/bin/python; do
    if [ -x "$candidate" ]; then PYTHON="$candidate"; break; fi
done

if [ -n "$PYTHON" ]; then
    ok "Python: $PYTHON"
    "$PYTHON" - <<'PY'
import sys
try:
    import torch
except Exception as exc:
    print(f"  \033[0;31m✗\033[0m torch import failed: {exc}")
    sys.exit(1)
hip = getattr(torch.version, "hip", None)
available = torch.cuda.is_available()
print(f"  \033[0;32m✓\033[0m torch {torch.__version__}")
print("  " + ("\033[0;32m✓\033[0m" if hip else "\033[0;33m!\033[0m") + f" HIP runtime: {hip or 'not a ROCm build'}")
print("  " + ("\033[0;32m✓\033[0m" if available else "\033[0;31m✗\033[0m") + f" GPU available: {available}")
if available:
    props = torch.cuda.get_device_properties(0)
    print(f"  \033[0;32m✓\033[0m Device: {torch.cuda.get_device_name(0)}")
    print(f"  \033[0;32m✓\033[0m Visible memory: {props.total_memory / 1024**3:.1f} GiB")
    print(f"  \033[0;32m✓\033[0m Compute capability: {props.major}.{props.minor}")
try:
    import onnxruntime
    providers = onnxruntime.get_available_providers()
    print(f"  \033[0;32m✓\033[0m onnxruntime providers: {', '.join(providers)}")
except Exception as exc:
    print(f"  \033[0;33m!\033[0m onnxruntime: {exc}")
PY
else
    warn "No python_embeded found - run this from the ComfyUI-Easy-Install folder"
fi

section "Kernel messages (amdgpu)"
if command -v dmesg >/dev/null 2>&1; then
    msgs=$(dmesg 2>/dev/null | grep -iE 'amdgpu|kfd|ring gfx|GPU reset|VM_L2' | tail -n 12)
    if [ -n "$msgs" ]; then
        echo "$msgs" | while read -r line; do
            case "$line" in
                *error*|*ERROR*|*fail*|*FAIL*|*reset*|*hang*) echo -e "  ${RED}${line}${RESET}" ;;
                *) echo -e "  ${YELLOW}${line}${RESET}" ;;
            esac
        done
    else
        ok "No amdgpu errors in dmesg"
    fi
else
    warn "dmesg not available"
fi

section "Hints"
echo "  • For Strix Point (Radeon 880M/890M, gfx1150) use PyTorch 2.11 + ROCm 7.2."
echo "  • If the GPU is not detected, add to .cei_amd_env: HSA_OVERRIDE_GFX_VERSION=11.0.0"
echo "  • If the APU freezes under load, add to .cei_amd_env: HSA_ENABLE_SDMA=0"
echo "  • Keep at least 8 GiB of system RAM free: the iGPU shares it via GTT."
echo "  • ComfyUI flags: --use-pytorch-cross-attention (added by run_amd_gpu.sh)."

echo ""
if [ "$FAIL" -eq 0 ]; then
    echo -e "${GREEN}No blocking problems found.${RESET}"
else
    echo -e "${YELLOW}${FAIL} check(s) need attention - see above.${RESET}"
fi
echo ""
read -p "Press Enter to close..."
