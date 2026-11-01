#!/bin/bash

# Title: Torch 2.11.0 (ROCm 7.2) for 'ComfyUI Easy Install' by ivo
# Pixaroma Community Edition - AMD ROCm pack
#
# Installs the PyTorch build used by run_amd_gpu.sh. Works on RDNA2/RDNA3/
# RDNA3.5/RDNA4 Radeon GPUs and Ryzen APUs (gfx1150 Strix Point included).

set -euo pipefail
cd "$(dirname "$0")"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

FLAG_DIR="$(pwd)"
PIP_NC="--no-cache-dir"
if [ -f "$FLAG_DIR/../Tools/Helper-CEI/keep_cache.flag" ]; then PIP_NC=""; fi
PIPargs=($PIP_NC --no-warn-script-location --timeout=1000 --retries 200 --root-user-action=ignore)

ROCM_VERSION="${CEI_ROCM_VERSION:-7.2}"
ROCM_INDEX="https://download.pytorch.org/whl/rocm${ROCM_VERSION}"

echo -e "${GREEN}::::::::::::::: Torch 2.11.0 (ROCm ${ROCM_VERSION}) installer for Linux :::::::::::::::${RESET}"

# Locate embedded Python (script runs from Add-Ons/Torch-Pack)
PYTHON=""
for candidate in \
    "../../python_embeded/python" \
    "../../python_embeded/bin/python3" \
    "../../python_embeded/bin/python" \
    "../../python_embeded/python3" \
    "../python_embeded/python" \
    "../python_embeded/bin/python3" \
    "../python_embeded/bin/python" \
    "../python_embeded/python3"
do
    if [ -x "$candidate" ]; then
        PYTHON="$candidate"
        echo -e "${GREEN}✓${RESET} Using embedded Python: ${YELLOW}${PYTHON}${RESET}"
        break
    fi
done

if [ -z "$PYTHON" ]; then
    echo -e "${RED}✗ Embedded Python not found!${RESET}"
    echo -e "${YELLOW}Run this from the 'ComfyUI-Easy-Install/Add-Ons/Torch-Pack' folder.${RESET}"
    exit 1
fi

echo -e "\n${CYAN}::::::::::::::: Currently Installed Versions :::::::::::::::${RESET}"
CURRENT_TORCH=$("$PYTHON" -c "import torch; print(torch.__version__)" 2>/dev/null || echo "Not installed")
CURRENT_TORCHVISION=$("$PYTHON" -c "import torchvision; print(torchvision.__version__)" 2>/dev/null || echo "Not installed")
CURRENT_TORCHAUDIO=$("$PYTHON" -c "import torchaudio; print(torchaudio.__version__)" 2>/dev/null || echo "Not installed")
CURRENT_HIP=$("$PYTHON" -c "import torch; print(torch.version.hip or 'N/A')" 2>/dev/null || echo "N/A")

echo -e "    ${YELLOW}torch:${RESET}       $CURRENT_TORCH"
echo -e "    ${YELLOW}torchvision:${RESET} $CURRENT_TORCHVISION"
echo -e "    ${YELLOW}torchaudio:${RESET}  $CURRENT_TORCHAUDIO"
echo -e "    ${YELLOW}HIP:${RESET}         $CURRENT_HIP"
echo -e "${CYAN}::::::::::::::: Target Versions :::::::::::::::${RESET}"
echo -e "    ${GREEN}torch:${RESET}       2.11.0+rocm${ROCM_VERSION}"
echo -e "    ${GREEN}torchvision:${RESET} 0.26.0+rocm${ROCM_VERSION}"
echo -e "    ${GREEN}torchaudio:${RESET}  2.11.0+rocm${ROCM_VERSION}"
echo -e "    ${GREEN}ROCm:${RESET}        ${ROCM_VERSION}"
echo ""

echo -e "${CYAN}Uninstalling existing torch packages...${RESET}"
"$PYTHON" -I -m pip uninstall torch torchvision torchaudio -y --root-user-action=ignore || true
"$PYTHON" -I -m pip uninstall pytorch-triton-rocm triton -y --root-user-action=ignore || true
"$PYTHON" -I -m pip uninstall onnxruntime-gpu -y --root-user-action=ignore || true

echo -e "${GREEN}::::::::::::::: Installing${YELLOW} Torch 2.11.0 + ROCm ${ROCM_VERSION} ${GREEN}:::::::::::::::${RESET}\n"
"$PYTHON" -I -m pip install \
    torch==2.11.0 torchvision==0.26.0 torchaudio==2.11.0 \
    --index-url "$ROCM_INDEX" "${PIPargs[@]}"

# PyTorch ROCm wheels require the matching ROCm Triton build
TRITON_SPEC=$("$PYTHON" -c "import importlib.metadata as md; reqs = md.metadata('torch').get_all('Requires-Dist') or []; r = next((x for x in reqs if x.startswith(('pytorch-triton-rocm','triton'))), ''); print(r.split(';')[0].strip()) if '==' in r else print('')" 2>/dev/null || true)
if [ -n "$TRITON_SPEC" ]; then
    echo -e "${YELLOW}Installing ${TRITON_SPEC}...${RESET}"
    "$PYTHON" -I -m pip install --force-reinstall "$TRITON_SPEC" --index-url "$ROCM_INDEX" "${PIPargs[@]}" || \
        echo -e "${YELLOW}ROCm Triton install skipped${RESET}"
fi

# Keep a working CPU onnxruntime for RMBG/segmentation nodes
"$PYTHON" -I -m pip install --force-reinstall onnxruntime "${PIPargs[@]}" || true

# Disable Searge_LLM (its CUDA-only llama.cpp build breaks on ROCm)
CUSTOM_NODES_DIR="../ComfyUI/custom_nodes"
DISABLED_DIR="$CUSTOM_NODES_DIR/.disabled"
SEARGE_DIR="$CUSTOM_NODES_DIR/ComfyUI_Searge_LLM"
mkdir -p "$DISABLED_DIR"
if [ -d "$SEARGE_DIR" ]; then
    echo -e "\n${GREEN}::::::::::::::: Disabling${YELLOW} Searge_LLM ${GREEN}:::::::::::::::${RESET}"
    mv "$SEARGE_DIR" "$DISABLED_DIR/ComfyUI_Searge_LLM" || true
    echo -e "${GREEN}::::::::: ${YELLOW}Searge_LLM ${GREEN}disabled successfully :::::::::${RESET}"
fi

echo
echo -e "${GREEN}::::::::::::::: Verifying ROCm device :::::::::::::::${RESET}"
"$PYTHON" - <<'PY' || true
import torch
print(f"torch {torch.__version__} | HIP {torch.version.hip} | GPU available: {torch.cuda.is_available()}")
if torch.cuda.is_available():
    print(f"Device: {torch.cuda.get_device_name(0)}")
else:
    print("If this is unexpected, run Add-Ons/AMD-ROCm-Diagnose.sh and check render/video group membership.")
PY

echo
echo -e "${GREEN}::::::::::::::::::::::: Installation Complete ::::::::::::::::::::::${RESET}"
echo -e "    ${YELLOW}Start ComfyUI with: ./run_amd_gpu.sh${RESET}"
echo -e "    ${RED}Do NOT install SageAttention / FlashAttention / Nunchaku CUDA add-ons.${RESET}"
read -p "Press any key to continue..."
