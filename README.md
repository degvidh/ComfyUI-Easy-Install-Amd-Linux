<div align="center">

# ComfyUI-Easy-Install

Portable **ComfyUI** for **macOS** and **Linux** 🔹 NVIDIA CUDA & AMD ROCm 🔹 Pixaroma Community Edition  
[![GitHub Release](https://img.shields.io/github/v/release/Tavris1/ComfyUI-Easy-Install)](https://github.com/Tavris1/ComfyUI-Easy-Install/releases/latest/download/ComfyUI-Easy-Install.zip)
[![GitHub Release Date](https://img.shields.io/github/release-date/Tavris1/ComfyUI-Easy-Install?style=flat)](https://github.com/Tavris1/ComfyUI-Easy-Install/releases)
[![Downloads](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/Tavris1/95cfc6f0535930f25591dcfe08f34cc1/raw/downloads.json)](https://github.com/Tavris1/ComfyUI-Easy-Install/releases)
[![GitHub Downloads Latest](https://img.shields.io/github/downloads/Tavris1/ComfyUI-Easy-Install/latest/total?style=flat&label=⬇+latest&color=orange)](https://github.com/Tavris1/ComfyUI-Easy-Install/releases/latest/download/ComfyUI-Easy-Install.zip)

Dedicated to the **Pixaroma** team  
[![Dynamic JSON Badge](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fdiscord.com%2Fapi%2Finvites%2FgggpkVgBf3%3Fwith_counts%3Dtrue&query=%24.approximate_member_count&logo=discord&logoColor=white&label=Join%20Pixaroma%20Discord&color=FFDF00&suffix=%20users)](https://discord.com/invite/gggpkVgBf3)

</div>

---

## 📦 Included Components

<details>
<summary><b>Core Components</b></summary>

| 🔧 Component | 📝 Note |
|---|---|
| [Git](https://git-scm.com/) | ![Git version](https://img.shields.io/github/v/tag/git/git?label=&display_name=tag&color=blue) - Latest (will install/update if needed) |
| [Python](https://www.python.org/downloads/release/python-31210/) | ![Python version](https://img.shields.io/badge/3.12.10-blue) - Built from source |
| [ComfyUI](https://github.com/Comfy-Org/ComfyUI) | ![ComfyUI version](https://img.shields.io/github/v/release/Comfy-Org/ComfyUI?label=&display_name=tag) - Latest version |

</details>

<details>
<summary><b>Nodes from Pixaroma tutorials</b></summary>

| 🖼️ Image | 🎬 Video | 🎵 Audio | 🧩 Utility / WF | 🤖 Models |
|---|---|---|---|---|
| [Tiled Diffusion & VAE](https://github.com/shiimizu/ComfyUI-TiledDiffusion) | [VideoHelperSuite](https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite) | [MelBandRoFormer](https://github.com/kijai/ComfyUI-MelBandRoFormer) | [ComfyUI Manager](https://github.com/Comfy-Org/ComfyUI-Manager) | [QwenVL](https://github.com/1038lab/ComfyUI-QwenVL) |
| [Inpaint CropAndStitch](https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch) | [WanVideoWrapper](https://github.com/kijai/ComfyUI-WanVideoWrapper) | [Qwen3-TTS](https://github.com/flybirdxx/ComfyUI-Qwen-TTS) | [Easy-Use](https://github.com/yolain/ComfyUI-Easy-Use) | [GGUF](https://github.com/city96/ComfyUI-GGUF) |
| [ControlNet Aux](https://github.com/Fannovel16/comfyui_controlnet_aux) | [WanAnimatePreprocess](https://github.com/kijai/ComfyUI-WanAnimatePreprocess) | [FishAudioS2](https://github.com/Saganaki22/ComfyUI-FishAudioS2) | [KJNodes](https://github.com/kijai/ComfyUI-KJNodes) | |
| [LayerStyle](https://github.com/chflame163/ComfyUI_LayerStyle) | [SeedVR2 VideoUpscaler](https://github.com/numz/ComfyUI-SeedVR2_VideoUpscaler) | | [rgthree](https://github.com/rgthree/rgthree-comfy) | |
| [RMBG](https://github.com/1038lab/ComfyUI-RMBG) | | | [iTools](https://github.com/MohammadAboulEla/ComfyUI-iTools) | |
| [Easy-Sam3](https://github.com/yolain/ComfyUI-Easy-Sam3) | | | [ControlAltAI Nodes](https://github.com/gseth/ControlAltAI-Nodes) | |
| [SCAIL-Pose](https://github.com/kijai/ComfyUI-SCAIL-Pose) | | | ✨[Pixaroma](https://github.com/pixaroma/ComfyUI-Pixaroma) | |
| | | | [Krea2Edit](https://github.com/lbouaraba/comfyui-krea2edit) | |

</details>

<details>
<summary><b>Optional Add-ons Nodes and Tools</b></summary>

| 🧩 Nodes | 🛠️ Tools |
|---|---|
| [Nunchaku](https://github.com/nunchaku-ai/nunchaku) | Easy-Models-Linker |
| [SageAttention (v2.2.0)](https://github.com/woct0rdho/SageAttention) | ComfyUI-Version-Switcher |
| [FlashAttention](https://github.com/Dao-AILab/flash-attention) | Backup ComfyUI |
| [InsightFace](https://github.com/deepinsight/insightface) | Torch-Pack |
| [Trellis 2.0](https://github.com/visualbruno/ComfyUI-Trellis2) | |

</details>

## 🍎 macOS Installation

1. Clone this repository:
   ```bash
   git clone --single-branch --branch MAC-Linux https://github.com/Tavris1/ComfyUI-Easy-Install.git
   ```
2. Make the script executable and run it:
   ```bash
   cd ComfyUI-Easy-Install
   chmod +x ComfyUI-Easy-Install.sh
   ./ComfyUI-Easy-Install.sh
   ```
3. After installation, start ComfyUI:
   ```bash
   ./run_mac_mps.sh
   ```
4. See the [**Add-ons Installation**](#-add-ons-installation) section below for optional add-ons like Torch-Pack, SageAttention, and more.

<details>
<summary><b>Mac M1/M2 Optimization</b></summary>

The `run_mac_mps.sh` script includes optimizations for Apple Silicon (M1/M2) Macs:

- **Memory Management** - Memory clearing, optimized GC, configurable MPS watermark ratios
- **Performance** - MPS graph mode, descriptor caching, unified memory support
- **Compatibility** - FP32 accumulation, force-upcast attention, Float8 disabled (unsupported on MPS)

</details>

<details>
<summary><b>Troubleshooting macOS</b></summary>

- **Import Failures** - Some nodes may fail due to Apple Silicon incompatibility. Check console output and remove non-essential nodes.
- **Memory Issues** - Adjust `PYTORCH_MPS_HIGH_WATERMARK_RATIO` / `PYTORCH_MPS_LOW_WATERMARK_RATIO` in `run_mac_mps.sh`, use smaller models, reduce batch sizes.
- **Performance** - Use GGUF models, prefer smaller models (7B over 13B), avoid CPU-intensive nodes.

</details>

> [!TIP]
> - Multiple ComfyUI installs allowed without conflicts.
> - The installer automatically cleans up installer files and flattens the folder structure — no nested folders.

---

## 🐧 Linux and Proxmox Installation

<details>
<summary><b>Standard Linux Installation</b></summary>

1. Clone this repository:
   ```bash
   git clone -b MAC-Linux --single-branch https://github.com/Tavris1/ComfyUI-Easy-Install.git
   ```
2. Make the script executable and run it:
   ```bash
   cd ComfyUI-Easy-Install
   chmod +x ComfyUI-Easy-Install.sh
   ./ComfyUI-Easy-Install.sh
   ```
3. After installation, start ComfyUI:
   ```bash
   ./run_nvidia_gpu.sh   # NVIDIA
   ./run_amd_gpu.sh      # AMD (installed automatically on AMD systems)
   ```
   The installer detects the GPU automatically. On AMD it installs PyTorch
   with ROCm and creates `run_amd_gpu.sh`; on NVIDIA it uses CUDA 13.0.
4. See the [**Add-ons Installation**](#-add-ons-installation) section below for optional add-ons like CUDA Toolkit, SageAttention, Nunchaku, and more.

</details>

<details>
<summary><b>AMD ROCm Installation (Radeon / Ryzen APU)</b></summary>

#### Requirements

- A 64-bit Linux distribution with the `amdgpu` kernel driver loaded
  (`lsmod | grep amdgpu`). ROCm 7.2 supports RDNA2/3/3.5/4 Radeon GPUs and
  Ryzen AI APUs, including **gfx1150 (Strix Point, Radeon 880M/890M)** and
  **gfx1151 (Strix Halo)**.
- Your user in the `render` and `video` groups:
  ```bash
  sudo usermod -aG render,video "$USER"
  # log out and back in (or reboot) afterwards
  ```
- `/dev/kfd` and `/dev/dri/renderD128` must exist and be accessible.
- **You do not need to install the full ROCm SDK** for ComfyUI. The PyTorch
  ROCm wheels bundle the ROCm runtime libraries. Install `rocminfo` only if
  you want diagnostics (`sudo pacman -S rocminfo` / `sudo apt install rocminfo`).

#### Install

```bash
git clone -b MAC-Linux --single-branch https://github.com/Tavris1/ComfyUI-Easy-Install.git
cd ComfyUI-Easy-Install
chmod +x ComfyUI-Easy-Install.sh
./ComfyUI-Easy-Install.sh
```

The installer prints the detected backend and installs:

| Component | AMD selection |
|---|---|
| PyTorch | `torch 2.11.0 + rocm7.2`, `torchvision 0.26.0`, `torchaudio 2.11.0` |
| Triton | `triton-rocm` (matching the wheel, currently 3.6.0) |
| onnxruntime | CPU build (CUDA `onnxruntime-gpu` is removed; `onnxruntime-rocm` can be added manually with a system ROCm SDK) |
| llama.cpp | HIP if `hipcc` is available (ROCm SDK), else Vulkan, else CPU |

Force a backend or a different ROCm build with environment variables:

```bash
CEI_GPU=amd ./ComfyUI-Easy-Install.sh            # force AMD
CEI_ROCM_VERSION=7.1 ./ComfyUI-Easy-Install.sh   # use another ROCm wheel index
CEI_AMD_GFX=gfx1150 ./ComfyUI-Easy-Install.sh    # override the LLVM target
```

#### Start

```bash
./run_amd_gpu.sh
```

The launcher sets ROCm-friendly defaults (expandable HIP allocator, MIOpen
cache, AOTriton flash attention) and adds `--use-pytorch-cross-attention`.
`run_comfyui_desktop.sh` (the native-window launcher) applies the same ROCm
environment automatically.
Settings are stored in `.vram_config`, `.comfyui_flags_config`, and
`.cei_amd_env`.

#### Tuning for an APU (shared memory)

An iGPU has a small VRAM carve-out and a much larger **GTT** (shared system
RAM) pool. The launcher reads both from `/sys/class/drm/card*/device/` and
recommends `normal` when GTT is 8 GiB or more. Keep 6–8 GiB of system RAM free
for the OS and the CPU-side model weights.

Edit `.cei_amd_env` to add optional overrides:

```bash
# Only if the bundled runtime cannot see the GPU (older ROCm / new silicon)
HSA_OVERRIDE_GFX_VERSION=11.0.0
# If the APU freezes under sustained load
HSA_ENABLE_SDMA=0
```

Useful ComfyUI flags (add them via the launcher's `f` menu):
`--use-pytorch-cross-attention` (already default), `--lowvram` for very small
GTT, `--highvram` only when the model fits comfortably in GTT.

#### This reference machine

| Item | Value |
|---|---|
| CPU / GPU | AMD Ryzen AI 9 365 w/ Radeon 880M |
| LLVM target | `gfx1150` (Strix Point, RDNA 3.5) |
| Memory | 4 GiB VRAM carve-out + 24 GiB GTT, 27 GiB RAM |
| Kernel / driver | Arch Linux, `amdgpu`, `/dev/kfd` + `renderD128` |
| Torch stack | PyTorch 2.11.0 + ROCm 7.2 |

On this configuration, use **normal VRAM** (the launcher auto-selects it) and
SDXL/Flux GGUF models at reduced resolution. `gfx1150` kernels are included
natively in the PyTorch 2.11 ROCm 7.2 wheels, so no HSA override is needed.

#### Verify / troubleshoot

```bash
./Add-Ons/AMD-ROCm-Diagnose.sh
```

The diagnostic checks the kernel driver, `/dev/kfd` permissions, groups, GTT
and VRAM, `rocminfo`, and the torch HIP device. Common fixes:

- `GPU available: False` → check `render`/`video` groups and reboot.
- `HIP runtime: None` → the CUDA wheel was reinstalled by a custom node; run
  `Add-Ons/Torch-Pack/Torch2.11.0+rocm7.2.sh`.
- Node import errors mentioning `triton`, `flash_attn`, `xformers`, or
  `onnxruntime-gpu` → CUDA-only package; disable that node or install a CPU
  alternative. The installer already filters these from node requirements.
- `HSA_OVERRIDE_GFX_VERSION=11.0.0` is a **last resort** for unsupported
  targets; it makes the runtime use gfx1100 kernels.

> [!WARNING]
> CUDA-only add-ons do not work on ROCm: **SageAttention**, **FlashAttention**,
> **Nunchaku**, and the CUDA Toolkit installer. The Torch-Pack list marks the
> ROCm pack as recommended on AMD systems.

</details>

<details>
<summary><b>Proxmox LXC Container Setup</b></summary>

1. Clone this repository:
   ```bash
   git clone -b MAC-Linux --single-branch https://github.com/Tavris1/ComfyUI-Easy-Install.git
   ```
2. Make all scripts executable:
   ```bash
   cd ComfyUI-Easy-Install
   chmod +x *.sh
   ```
3. Setup Container - Install ComfyUI in the container - GPU Passthrough:
   ```bash
   ./comfyui-lxc-standalone.sh
   ```

**Hardware Requirements**: At least 8GB RAM · NVMe SSD recommended · GPU passthrough (optional)

</details>

<details>
<summary><b>Troubleshooting Linux / Proxmox</b></summary>

> For Linux/Proxmox support, contact [@VenimK](https://discord.com/users/venimk) on Discord

- **Permission Errors**: `chmod -R 755 ComfyUI-Easy-Install`
- **Performance**: Use NVMe for model storage, configure container resources, consider GPU passthrough

</details>

> [!NOTE]
> The Proxmox setup automatically configures most settings, but you may need to adjust container resources based on your needs.

> [!TIP]
> - [**For Windows installation click here**](https://github.com/Tavris1/ComfyUI-Easy-Install)

---

## 🧩 Add-ons Installation

After the main installation, you can install optional add-ons from the `Add-Ons/` folder. These scripts enhance ComfyUI with additional performance optimizations, model support, and utilities.

> [!IMPORTANT]
> The installer automatically flattens the folder structure. All add-on scripts are in `Add-Ons/` at the top level of your installation folder.

### AMD ROCm systems

On AMD, **skip every CUDA-only add-on**:

| Add-on | AMD status |
|---|---|
| CUDA Toolkit | ❌ NVIDIA only |
| SageAttention / FlashAttention | ❌ CUDA-only builds |
| Nunchaku | ❌ CUDA-only |
| Torch-Pack `+rocm7.2` | ✅ recommended |
| `Add-Ons/AMD-ROCm-Diagnose.sh` | ✅ recommended |

`run_amd_gpu.sh` already enables PyTorch cross-attention and the ROCm
flash-attention path, so no extra attention add-on is required.

### Recommended Order of Operations (Linux)

For Linux users planning to install CUDA-dependent add-ons like SageAttention, follow this order:

1. **Install CUDA Toolkit** (if not already installed) — see [CUDA Toolkit](#cuda-toolkit) below
2. **Switch Torch version** (if needed) — see [Torch-Pack](#torch-pack) below
3. **Install SageAttention** — see [SageAttention](#sageattention) below
4. **Install Nunchaku** — see [Nunchaku](#nunchaku) below
5. **Install other add-ons** — see [Other Add-ons](#other-add-ons) below

### CUDA Toolkit

> **Linux only** — macOS does not support NVIDIA CUDA.

The CUDA Toolkit is **required** for compiling certain add-ons like SageAttention and FlashAttention. It provides `nvcc` (the CUDA compiler) and development headers.

- The installer must match the CUDA version used by your PyTorch installation.
- The main installer ships with **Torch 2.11.0+cu130** (CUDA 13.0). If you switch Torch versions via Torch-Pack, install the matching CUDA toolkit.

```bash
bash Add-Ons/cuda-toolkit-installer.sh
```

Available CUDA versions:

| Option | CUDA Version |
|---|---|
| 1 | CUDA 12.8 |
| 2 | CUDA 13.0 |
| 3 | CUDA 13.1 |

The script auto-detects your Linux distribution and installs the appropriate NVIDIA repository packages.

### Torch-Pack

Quickly switch between different Torch/CUDA versions. Available for both macOS and Linux.

**Linux variants:**

| Script | Torch | Backend |
|---|---|---|
| `Torch2.7.1+cu128.sh` | 2.7.1 | CUDA 12.8 |
| `Torch2.8.0+cu128.sh` | 2.8.0 | CUDA 12.8 |
| `Torch2.9.1+cu130.sh` | 2.9.1 | CUDA 13.0 |
| `Torch2.10.0+cu130.sh` | 2.10.0 | CUDA 13.0 |
| `Torch2.13.0+cu130.sh` | 2.13.0 | CUDA 13.0 |
| `Torch2.11.0+rocm7.2.sh` | 2.11.0 | ROCm 7.2 |

**macOS variants:**

| Script | Torch |
|---|---|
| `Torch2.12.0-mac.sh` | 2.12.0 |
| `Torch2.13.0-mac.sh` | 2.13.0 |

```bash
bash Add-Ons/Torch-Pack/Torch2.13.0+cu130.sh     # Linux / NVIDIA
bash Add-Ons/Torch-Pack/Torch2.11.0+rocm7.2.sh   # Linux / AMD
bash Add-Ons/Torch-Pack/Torch2.13.0-mac.sh       # macOS
```

> [!WARNING]
> After switching Torch versions, install the matching CUDA Toolkit before compiling add-ons like SageAttention.

### SageAttention

> **Linux only** — requires NVIDIA CUDA for compilation. Not available on macOS.

SageAttention (v2.2.0) provides accelerated attention computation for supported models.

**Prerequisites:**
- CUDA Toolkit installed (version must match PyTorch's CUDA version) — see [CUDA Toolkit](#cuda-toolkit)
- Python development headers (`Python.h`)
- GCC < 16 (GCC 15 works with compatibility patches; GCC 16+ is not supported)

**Install Python dev headers by distribution:**

| Distro | Command |
|---|---|
| Debian/Ubuntu | `sudo apt-get install python3-dev` |
| Fedora/RHEL | `sudo dnf install python3-devel` |
| openSUSE | `sudo zypper install python3-devel` |
| Arch | `sudo pacman -S python` |

```bash
bash Add-Ons/SageAttention-NEXT.sh
```

The script automatically:
- Detects PyTorch's CUDA version and finds the matching CUDA toolkit
- Patches CUDA headers for GCC 15+ compatibility if needed
- Clones and compiles SageAttention v2.2.0

### Nunchaku

> **Linux only** — requires NVIDIA GPU. Not available on macOS.

Nunchaku provides optimized inference for certain model architectures.

**Version compatibility:**

| Python | Torch | CUDA |
|---|---|---|
| 3.11, 3.12 | 2.7, 2.8 | 12.8 |
| 3.11, 3.12 | 2.9 | 13.0 |

> [!WARNING]
> **Torch 2.9 requires CUDA 13.0.** If you're on Torch 2.9 with CUDA 12.8, switch to Torch 2.8 or upgrade CUDA.

```bash
bash Add-Ons/Nunchaku-NEXT.sh
```

### Other Add-ons

| Add-on | Platform | Description |
|---|---|---|
| **Easy-Models-Linker** | macOS & Linux | Links an existing **MODELS** folder via `extra_model_paths.yaml` — no re-download needed. Some folders like **LLM** and **llm_gguf** cannot be redirected. |
| **InsightFace** | macOS & Linux | Installs InsightFace pretrained models (non-commercial research only) |
| **Trellis2** | macOS & Linux | Installs Trellis 2.0 |
| **FlashAttention** | Linux only | Installs FlashAttention (requires CUDA Toolkit) |
| **ComfyUI-Version-Switcher** | macOS & Linux | Reversible rollback to a previous ComfyUI version on issues |
| **Backup ComfyUI** | macOS & Linux | Backup, restore, and manage your ComfyUI data folders |

<details>
<summary><b>Backup ComfyUI Details</b></summary>

- **Script**: `Add-Ons/Backup_ComfyUI.sh`
- **Version**: V2.01.3 (Pixaroma Community Edition, macOS/Linux by VenimK)
- **Backup location**: `~/ComfyUI_Backups/ComfyUI_backup_YYYYMMDD_HHMMSS`
- **What gets backed up**: `user`, `input`, `output` (always) · `models` (optional)

```bash
bash Add-Ons/Backup_ComfyUI.sh
```

</details>

---

## 🖥️ EZi Desktop (Native Window Mode)

Run ComfyUI in a native desktop window instead of a browser:

```bash
./run_comfyui_desktop.sh
```

| ⌨️ Action | 🍎 macOS | 🐧 Linux |
|---|---|---|
| Open Desktop Settings panel | `Cmd+Shift+I` | `Ctrl+Shift+I` |
| Open ComfyUI in browser | `Cmd+B` | `Ctrl+B` |

> [!NOTE]
> On Linux, pywebview requires a GTK or Qt backend. The launcher will attempt to install it automatically. If it fails, run:
> ```bash
> # GTK (recommended for Ubuntu/Pop!_OS/Debian)
> sudo apt-get install python3-gi python3-gi-cairo gir1.2-gtk-3.0 gir1.2-webkit2-4.1
> SYS_GI=$(python3 -c "import gi,os; print(os.path.dirname(gi.__file__))")
> ln -s "$SYS_GI" "$(./python_embeded/python -c "import site; print(site.getsitepackages()[0])")/gi"
>
> # Qt alternative (no sudo needed)
> ./python_embeded/python -m pip install PyQt6 qtpy PyQt6-WebEngine
> ```

---

## 🚀 EZi Launcher (Graphical Launcher)

A cross-platform graphical launcher that mirrors the Windows EZi Launcher UI:

```bash
./run_ezi_launcher.sh
```

Features:

- **Desktop / Browser / Hybrid** launch modes
- One-click launch for ComfyUI and attention backends (Sage, Flash, Kitchen)
- Update buttons for Easy-Install, ComfyUI Stable, ComfyUI Latest, and ComfyUI + Nodes
- Quick-access buttons for Output, Input, Workflows, and Models folders

> [!NOTE]
> The launcher requires the same pywebview backend as EZi Desktop. `run_ezi_launcher.sh` will install it automatically if needed.

---

<div align="center">

## ❤️ Support Me
Enjoy my projects? Any support is greatly appreciated!

[![PayPal](https://img.shields.io/badge/PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/VenimK)
[![GitHub Sponsors](https://img.shields.io/badge/Sponsor-30363D?style=for-the-badge&logo=GitHub-Sponsors&logoColor=#white)](https://github.com/sponsors/venimK)

</div>

