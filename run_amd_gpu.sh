#!/bin/bash

cd "$(dirname "$0")"

# Check if we're in the correct directory
if [ ! -d "ComfyUI" ] || [ ! -d "python_embeded" ]; then
    echo -e "${RED}ERROR: This script must be run from the ComfyUI-Easy-Install directory.${RESET}"
    echo -e "${YELLOW}Please run this script from inside the 'ComfyUI-Easy-Install' folder.${RESET}"
    echo -e "${CYAN}Current directory: $(pwd)${RESET}"
    echo -e "${CYAN}Expected to find: ComfyUI folder and python_embeded folder${RESET}"
    echo ""
    echo -e "${GREEN}Press any key to exit...${RESET}"
    read -n 1 -s
    exit 1
fi

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
RESET='\033[0m'

# Animation functions
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " ${CYAN}[%c]${RESET}  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

print_header() {
    clear
    echo -e "${MAGENTA}╔═══════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${MAGENTA}║${CYAN}                                                           ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}║${CYAN}        ╔═╗╔═╗╔╦╗╔═╗╦ ╦╦ ╦╦  ${YELLOW}╔═╗╔═╗╔═╗╦ ╦              ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}║${CYAN}        ║  ║ ║║║║╠╣ ╚╦╝║ ║║  ${YELLOW}║╣ ╠═╣╚═╗╚╦╝              ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}║${CYAN}        ╚═╝╚═╝╩ ╩╚   ╩ ╚═╝╩  ${YELLOW}╚═╝╩ ╩╚═╝ ╩               ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}║${CYAN}                                                           ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}║${GREEN}              🎨 Easy Install by VenimK 🚀                ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}║${CYAN}                                                           ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}║${CYAN}               🎨 Pixaroma Soldier 🚀                       ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}║${CYAN}                                                           ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}║${GREEN}            ⚡ AMD ROCm Edition (Linux) ⚡                 ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}║${CYAN}                                                           ${MAGENTA}║${RESET}"
    echo -e "${MAGENTA}╚═══════════════════════════════════════════════════════════╝${RESET}"
    echo ""
}

loading_bar() {
    local duration=$1
    local message=$2
    local width=50
    echo -ne "${YELLOW}${message}${RESET}\n"
    for ((i = 0 ; i <= width ; i++)); do
        echo -ne "${GREEN}▓${RESET}"
        sleep $(echo "scale=4; $duration/$width" | bc)
    done
    echo -e " ${GREEN}✓${RESET}"
}

generate_ascii_art() {
    local delay=0.05
    echo -e "${CYAN}🎨 Initializing AI Image Generator...${RESET}"
    sleep 0.5
    echo ""
    
    # Frame 1 - Empty canvas
    echo -e "${YELLOW}[Generating...]${RESET} Step 1/4 - Preparing canvas"
    echo -e "${MAGENTA}┌────────────────────┐${RESET}"
    for i in {1..6}; do
        echo -e "${MAGENTA}│${RESET}                    ${MAGENTA}│${RESET}"
        sleep $delay
    done
    echo -e "${MAGENTA}└────────────────────┘${RESET}"
    sleep 0.3
    
    # Clear and redraw with noise
    clear
    print_header
    echo -e "${YELLOW}[Generating...]${RESET} Step 2/4 - Adding noise"
    echo -e "${MAGENTA}┌────────────────────┐${RESET}"
    local chars=".:░▒▓"
    for i in {1..6}; do
        echo -ne "${MAGENTA}│${RESET}"
        for j in {1..20}; do
            local rand_char=${chars:$((RANDOM % ${#chars})):1}
            echo -ne "${CYAN}${rand_char}${RESET}"
            sleep 0.002
        done
        echo -e "${MAGENTA}│${RESET}"
    done
    echo -e "${MAGENTA}└────────────────────┘${RESET}"
    sleep 0.3
    
    # Clear and redraw with pattern forming
    clear
    print_header
    echo -e "${YELLOW}[Generating...]${RESET} Step 3/4 - Forming patterns"
    echo -e "${MAGENTA}┌────────────────────┐${RESET}"
    echo -e "${MAGENTA}│${RESET}${GREEN}░░░▒▒▓▓██${YELLOW}☼☼${GREEN}██▓▓▒▒░░░${RESET}${MAGENTA}│${RESET}"
    sleep $delay
    echo -e "${MAGENTA}│${RESET}${GREEN}░░▒▒▓▓${CYAN}████${YELLOW}◉◉${CYAN}████${GREEN}▓▓▒▒░░${RESET}${MAGENTA}│${RESET}"
    sleep $delay
    echo -e "${MAGENTA}│${RESET}${GREEN}░▒▓${CYAN}██${BLUE}▓▓▓▓${YELLOW}││${BLUE}▓▓▓▓${CYAN}██${GREEN}▓▒░${RESET}${MAGENTA}│${RESET}"
    sleep $delay
    echo -e "${MAGENTA}│${RESET}${GREEN}░▒▓${CYAN}██${BLUE}▓${WHITE}◆◆◆◆${BLUE}▓${CYAN}██${GREEN}▓▒░${RESET}${MAGENTA}│${RESET}"
    sleep $delay
    echo -e "${MAGENTA}│${RESET}${GREEN}░░▒▓${CYAN}███${BLUE}▓▓▓▓${CYAN}███${GREEN}▓▒░░${RESET}${MAGENTA}│${RESET}"
    sleep $delay
    echo -e "${MAGENTA}│${RESET}${GREEN}░░░▒▓▓${CYAN}██████${GREEN}▓▓▒░░░${RESET}${MAGENTA}│${RESET}"
    echo -e "${MAGENTA}└────────────────────┘${RESET}"
    sleep 0.3
    
    # Clear and show final image
    clear
    print_header
    echo -e "${GREEN}[Complete!]${RESET} Step 4/4 - Rendering final image ✓"
    echo -e "${MAGENTA}┌────────────────────┐${RESET}"
    echo -e "${MAGENTA}│${RESET}${GREEN}░░░▒▒▓▓██${YELLOW}☼☼${GREEN}██▓▓▒▒░░░${RESET}${MAGENTA}│${RESET}"
    echo -e "${MAGENTA}│${RESET}${GREEN}░░▒▒▓▓${CYAN}████${YELLOW}◉◉${CYAN}████${GREEN}▓▓▒▒░░${RESET}${MAGENTA}│${RESET}"
    echo -e "${MAGENTA}│${RESET}${GREEN}░▒▓${CYAN}██${BLUE}▓▓▓▓${YELLOW}││${BLUE}▓▓▓▓${CYAN}██${GREEN}▓▒░${RESET}${MAGENTA}│${RESET}"
    echo -e "${MAGENTA}│${RESET}${GREEN}░▒▓${CYAN}██${BLUE}▓${WHITE}◆◆◆◆${BLUE}▓${CYAN}██${GREEN}▓▒░${RESET}${MAGENTA}│${RESET}"
    echo -e "${MAGENTA}│${RESET}${GREEN}░░▒▓${CYAN}███${BLUE}▓▓▓▓${CYAN}███${GREEN}▓▒░░${RESET}${MAGENTA}│${RESET}"
    echo -e "${MAGENTA}│${RESET}${GREEN}░░░▒▓▓${CYAN}██████${GREEN}▓▓▒░░░${RESET}${MAGENTA}│${RESET}"
    echo -e "${MAGENTA}└────────────────────┘${RESET}"
    echo ""
    
    # Stats display
    echo -e "${CYAN}╭─────────────────────────────────────╮${RESET}"
    echo -e "${CYAN}│${RESET} ${YELLOW}⚡${RESET} Seed: ${WHITE}42424242${RESET}                  ${CYAN}│${RESET}"
    echo -e "${CYAN}│${RESET} ${GREEN}✓${RESET} Steps: ${WHITE}20${RESET}                        ${CYAN}│${RESET}"
    echo -e "${CYAN}│${RESET} ${MAGENTA}🎨${RESET} Sampler: ${WHITE}DPM++ 2M Karras${RESET}      ${CYAN}│${RESET}"
    echo -e "${CYAN}│${RESET} ${BLUE}⏱${RESET}  Time: ${WHITE}0.${RANDOM:0:2}s${RESET}                   ${CYAN}│${RESET}"
    echo -e "${CYAN}╰─────────────────────────────────────╯${RESET}"
    echo ""
    sleep 1
}

# ── AMD / ROCm helpers ──────────────────────────────────────────────
# Find the first AMD GPU DRM device (vendor 0x1002).
amd_drm_device() {
    local card vendor
    for card in /sys/class/drm/card[0-9]*/device; do
        [ -r "$card/vendor" ] || continue
        vendor=$(cat "$card/vendor" 2>/dev/null)
        if [ "$vendor" = "0x1002" ]; then
            printf '%s\n' "$card"
            return 0
        fi
    done
    return 1
}

amd_gpu_name() {
    local name=""
    if command -v lspci >/dev/null 2>&1; then
        name=$(lspci 2>/dev/null | grep -iE 'VGA compatible controller|Display controller' \
            | grep -iE 'AMD/ATI|Advanced Micro Devices' | head -n1 \
            | sed 's/.*: //; s/ (rev.*//; s/^Advanced Micro Devices, Inc. \[AMD\/ATI\] //')
    fi
    if [ -z "$name" ] && command -v rocminfo >/dev/null 2>&1; then
        name=$(rocminfo 2>/dev/null | awk -F': *' '/Marketing Name/ {print $2; exit}')
    fi
    printf '%s\n' "${name:-AMD GPU}"
}

# Read the amount of GPU-visible memory. On APUs the small VRAM carve-out is
# less relevant than GTT (shared system RAM exposed to the GPU), so consider
# both when picking a ComfyUI VRAM mode.
detect_vram_mode() {
    local dev total_vram=0 total_gtt=0 vram_gb=0 gtt_gb=0

    if dev=$(amd_drm_device); then
        total_vram=$(cat "$dev/mem_info_vram_total" 2>/dev/null || echo 0)
        total_gtt=$(cat "$dev/mem_info_gtt_total" 2>/dev/null || echo 0)
    fi

    # Keep arithmetic safe if sysfs returned something unexpected
    case "$total_vram" in ''|*[!0-9]*) total_vram=0 ;; esac
    case "$total_gtt"  in ''|*[!0-9]*) total_gtt=0  ;; esac

    vram_gb=$(( total_vram / 1073741824 ))
    gtt_gb=$(( total_gtt / 1073741824 ))

    # APU / integrated GPU: shared memory makes the effective budget larger
    # than the VRAM carve-out. Prefer "normal" so ComfyUI can offload when
    # needed instead of splitting every model with --lowvram.
    if [ "$gtt_gb" -ge 8 ]; then
        echo "normal"
    elif [ "$vram_gb" -ge 12 ]; then
        echo "high"
    elif [ "$vram_gb" -ge 6 ]; then
        echo "normal"
    else
        echo "low"
    fi
}

amd_memory_summary() {
    local dev vram gtt
    if dev=$(amd_drm_device); then
        vram=$(cat "$dev/mem_info_vram_total" 2>/dev/null || echo 0)
        gtt=$(cat "$dev/mem_info_gtt_total" 2>/dev/null || echo 0)
        printf 'VRAM %s GB / GTT %s GB' \
            "$(( vram / 1073741824 ))" "$(( gtt / 1073741824 ))"
    else
        printf 'memory info unavailable'
    fi
}

# Get VRAM flag based on mode
get_vram_flag() {
    local mode=$1
    case "$mode" in
        low) echo "--lowvram" ;;
        high) echo "--highvram" ;;
        normal) echo "" ;;
        *) echo "" ;;
    esac
}

print_header

# Detect Python environment
echo -e "${CYAN}🔍 Detecting Python environment...${RESET}"
PYTHON_EXEC=""

# Check for new installer structure (direct Python installation)
if [ -f "python_embeded/python" ]; then
    PYTHON_EXEC="./python_embeded/python"
    echo -e "${GREEN}   ✓ Found Python (embedded)${RESET}"
    echo -e "${GREEN}   ✓ Using direct embedded Python (no venv activation needed)${RESET}"
# Check for old virtual environment structure
elif [ -d "python_embeded_3.12/bin" ]; then
    PYTHON_PATH="python_embeded_3.12/bin"
    PYTHON_EXEC="./python_embeded_3.12/bin/python3"
    echo -e "${GREEN}   ✓ Found Python 3.12${RESET}"
elif [ -d "python_embeded_3.11/bin" ]; then
    PYTHON_PATH="python_embeded_3.11/bin"
    PYTHON_EXEC="./python_embeded_3.11/bin/python3"
    echo -e "${GREEN}   ✓ Found Python 3.11${RESET}"
elif [ -d "python_embeded/bin" ]; then
    PYTHON_PATH="python_embeded/bin"
    PYTHON_EXEC="./python_embeded/bin/python3"
    echo -e "${GREEN}   ✓ Found Python (embedded)${RESET}"
else
    echo -e "${RED}   ✗ No embedded Python found, using system Python${RESET}"
    PYTHON_EXEC="python3"
fi
echo ""

# Activate virtual environment if we have one (old installer structure)
if [ -n "$PYTHON_PATH" ]; then
    echo -e "${CYAN}🐍 Activating Python environment...${RESET}"
    sleep 0.5
    source "$PYTHON_PATH/activate" 2>/dev/null && echo -e "${GREEN}   ✓ Environment activated${RESET}" || echo -e "${YELLOW}   ⚠ Using direct Python${RESET}"
    echo ""
else
    # New installer structure - no activation needed
    echo -e "${CYAN}🐍 Python environment ready...${RESET}"
    echo ""
fi

# Show ASCII art generation animation
generate_ascii_art

# Ask for custom output directory
CONFIG_FILE=".output_dir_config"
custom_output_dir=""

# Check if config file exists
if [ -f "$CONFIG_FILE" ]; then
    custom_output_dir=$(cat "$CONFIG_FILE")
    clear
    print_header
    echo -e "${CYAN}📁 Output Directory Configuration${RESET}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    if [ -n "$custom_output_dir" ]; then
        echo -e "${GREEN}   ✓ Saved output directory: ${YELLOW}${custom_output_dir}${RESET}"
    else
        echo -e "${GREEN}   ✓ Using default output directory${RESET}"
    fi
    echo ""
    echo -e "${YELLOW}Press Enter to keep current, or type 'c' to change:${RESET}"
    read -p "> " change_choice
    
    if [ "$change_choice" = "c" ] || [ "$change_choice" = "C" ]; then
        clear
        print_header
        echo -e "${CYAN}📁 Output Directory Configuration${RESET}"
        echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
        echo ""
        echo -e "${YELLOW}Enter new output directory path:${RESET}"
        echo -e "${CYAN}Press Enter to use default, or type path:${RESET}"
        read -p "Path: " custom_output_dir
        echo "$custom_output_dir" > "$CONFIG_FILE"
        echo ""
    fi
else
    # First time setup
    clear
    print_header
    echo -e "${CYAN}📁 Output Directory Configuration${RESET}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    echo -e "${YELLOW}Do you want to use a custom output directory?${RESET}"
    echo -e "${CYAN}Press Enter to use default, or type path:${RESET}"
    read -p "Path: " custom_output_dir
    echo "$custom_output_dir" > "$CONFIG_FILE"
    echo ""
fi

# Ask for listening address
LISTEN_CONFIG_FILE=".listen_address_config"
LISTEN_ADDRESS=""

# Check if config file exists
if [ -f "$LISTEN_CONFIG_FILE" ]; then
    LISTEN_ADDRESS=$(cat "$LISTEN_CONFIG_FILE")
    clear
    print_header
    echo -e "${CYAN}🌐 Network Configuration${RESET}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    if [ -n "$LISTEN_ADDRESS" ]; then
        if [ "$LISTEN_ADDRESS" = "0.0.0.0" ]; then
            echo -e "${GREEN}   ✓ Saved setting: ${YELLOW}LAN Access (0.0.0.0)${RESET}"
            echo -e "${CYAN}     Accessible from other devices on your network${RESET}"
        elif [ "$LISTEN_ADDRESS" = "127.0.0.1" ]; then
            echo -e "${GREEN}   ✓ Saved setting: ${YELLOW}Local Only (127.0.0.1)${RESET}"
            echo -e "${CYAN}     Accessible only from this computer${RESET}"
        else
            echo -e "${GREEN}   ✓ Saved setting: ${YELLOW}Custom IP (${LISTEN_ADDRESS})${RESET}"
        fi
    else
        echo -e "${GREEN}   ✓ Using default: ${YELLOW}LAN Access (0.0.0.0)${RESET}"
        LISTEN_ADDRESS="0.0.0.0"
    fi
    echo ""
    echo -e "${YELLOW}Press Enter to keep current, or 'c' to change:${RESET}"
    read -p "> " change_choice
    
    if [ "$change_choice" = "c" ] || [ "$change_choice" = "C" ]; then
        clear
        print_header
        echo -e "${CYAN}🌐 Network Configuration${RESET}"
        echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
        echo ""
        echo -e "${YELLOW}Choose listening address:${RESET}"
        echo -e "${CYAN}1) LAN Access (0.0.0.0) - For Proxmox/Network access${RESET}"
        echo -e "${CYAN}2) Local Only (127.0.0.1) - For security${RESET}"
        echo -e "${CYAN}3) Custom IP address${RESET}"
        echo -e "${CYAN}Choose 1-3:${RESET}"
        read -p "Choice: " listen_choice
        
        case $listen_choice in
            1)
                LISTEN_ADDRESS="0.0.0.0"
                echo "$LISTEN_ADDRESS" > "$LISTEN_CONFIG_FILE"
                ;;
            2)
                LISTEN_ADDRESS="127.0.0.1"
                echo "$LISTEN_ADDRESS" > "$LISTEN_CONFIG_FILE"
                ;;
            3)
                read -p "Enter IP address: " custom_ip
                if [ -n "$custom_ip" ]; then
                    LISTEN_ADDRESS="$custom_ip"
                    echo "$LISTEN_ADDRESS" > "$LISTEN_CONFIG_FILE"
                fi
                ;;
            *)
                echo -e "${YELLOW}Keeping current setting${RESET}"
                ;;
        esac
        echo ""
    fi
else
    clear
    print_header
    echo -e "${CYAN}🌐 Network Configuration${RESET}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    echo -e "${YELLOW}Choose ComfyUI listening address:${RESET}"
    echo -e "${CYAN}1) LAN Access (0.0.0.0) - For Proxmox/Network access${RESET}"
    echo -e "${CYAN}2) Local Only (127.0.0.1) - For security${RESET}"
    echo -e "${CYAN}3) Custom IP address${RESET}"
    echo -e "${CYAN}Press Enter for LAN Access (default), or choose 1-3:${RESET}"
    read -p "Choice: " listen_choice
    
    case $listen_choice in
        1|"")
            LISTEN_ADDRESS="0.0.0.0"
            ;;
        2)
            LISTEN_ADDRESS="127.0.0.1"
            ;;
        3)
            read -p "Enter IP address: " custom_ip
            if [ -n "$custom_ip" ]; then
                LISTEN_ADDRESS="$custom_ip"
            else
                LISTEN_ADDRESS="0.0.0.0"
            fi
            ;;
        *)
            LISTEN_ADDRESS="0.0.0.0"
            ;;
    esac
    echo "$LISTEN_ADDRESS" > "$LISTEN_CONFIG_FILE"
    echo ""
fi

# VRAM Configuration
VRAM_CONFIG_FILE=".vram_config"
VRAM_MODE=""
VRAM_FLAG=""

# Check if VRAM config file exists
if [ -f "$VRAM_CONFIG_FILE" ]; then
    VRAM_MODE=$(cat "$VRAM_CONFIG_FILE")
    clear
    print_header
    echo -e "${CYAN}🎮 GPU VRAM Configuration${RESET}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    
    if [ -n "$VRAM_MODE" ]; then
        case "$VRAM_MODE" in
            auto)
                DETECTED=$(detect_vram_mode)
                echo -e "${GREEN}   ✓ Mode: ${YELLOW}Auto-detect (${DETECTED})${RESET}"
                ;;
            low)
                echo -e "${GREEN}   ✓ Mode: ${YELLOW}Low VRAM (--lowvram)${RESET}"
                ;;
            normal)
                echo -e "${GREEN}   ✓ Mode: ${YELLOW}Normal VRAM${RESET}"
                ;;
            high)
                echo -e "${GREEN}   ✓ Mode: ${YELLOW}High VRAM (--highvram)${RESET}"
                ;;
        esac
    else
        echo -e "${GREEN}   ✓ Mode: ${YELLOW}Auto-detect${RESET}"
        VRAM_MODE="auto"
    fi
    
    echo ""
    echo -e "${YELLOW}Press Enter to keep, 'c' to change, 'f' for custom flags:${RESET}"
    read -p "> " vram_choice
    
    if [ "$vram_choice" = "c" ] || [ "$vram_choice" = "C" ]; then
        clear
        print_header
        echo -e "${CYAN}🎮 GPU VRAM Configuration${RESET}"
        echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
        echo ""
        echo -e "${YELLOW}Choose VRAM mode:${RESET}"
        echo -e "${CYAN}a) Auto-detect (recommended)${RESET}"
        echo -e "${CYAN}l) Low VRAM (--lowvram) - Tight VRAM/GTT, small models${RESET}"
        echo -e "${CYAN}n) Normal VRAM - Balanced (default for APUs)${RESET}"
        echo -e "${CYAN}h) High VRAM (--highvram) - Model fits fully in GTT${RESET}"
        read -p "Choice [a]: " mode_choice
        
        case "$mode_choice" in
            l|L) VRAM_MODE="low" ;;
            n|N) VRAM_MODE="normal" ;;
            h|H) VRAM_MODE="high" ;;
            *) VRAM_MODE="auto" ;;
        esac
        echo "$VRAM_MODE" > "$VRAM_CONFIG_FILE"
        echo ""
    elif [ "$vram_choice" = "f" ] || [ "$vram_choice" = "F" ]; then
        clear
        print_header
        echo -e "${CYAN}⚙️  Custom Flags Configuration${RESET}"
        echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
        echo ""
        echo -e "${YELLOW}Enter custom flags for ComfyUI (e.g. --force-fp16 --preview-method auto):${RESET}"
        echo -e "${CYAN}Press Enter to clear, or type flags:${RESET}"
        read -p "> " custom_flags
        echo "$custom_flags" > ".comfyui_flags_config"
        echo -e "${GREEN}Custom flags saved!${RESET}"
        echo ""
    fi
else
    # First time setup
    clear
    print_header
    echo -e "${CYAN}🎮 GPU VRAM Configuration${RESET}"
    echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
    echo ""
    
    DETECTED=$(detect_vram_mode)
    GPU_NAME=$(amd_gpu_name)
    MEM_SUMMARY=$(amd_memory_summary)
    
    if [ -n "$GPU_NAME" ]; then
        echo -e "${GREEN}   ✓ Detected GPU: ${YELLOW}${GPU_NAME}${RESET}"
        echo -e "${GREEN}   ✓ Memory: ${YELLOW}${MEM_SUMMARY}${RESET}"
    fi
    
    case "$DETECTED" in
        low)
            echo -e "${GREEN}   ✓ Recommended mode: ${YELLOW}Low VRAM (--lowvram)${RESET}"
            ;;
        normal)
            echo -e "${GREEN}   ✓ Recommended mode: ${YELLOW}Normal VRAM${RESET}"
            ;;
        high)
            echo -e "${GREEN}   ✓ Recommended mode: ${YELLOW}High VRAM (--highvram)${RESET}"
            ;;
    esac
    
    echo ""
    echo -e "${YELLOW}Choose VRAM mode:${RESET}"
    echo -e "${CYAN}a) Auto-detect (recommended)${RESET}"
    echo -e "${CYAN}l) Low VRAM (--lowvram) - Tight VRAM/GTT, small models${RESET}"
    echo -e "${CYAN}n) Normal VRAM - Balanced (default for APUs)${RESET}"
    echo -e "${CYAN}h) High VRAM (--highvram) - Model fits fully in GTT${RESET}"
    read -p "Choice [a]: " mode_choice
    
    case "$mode_choice" in
        l|L) VRAM_MODE="low" ;;
        n|N) VRAM_MODE="normal" ;;
        h|H) VRAM_MODE="high" ;;
        *) VRAM_MODE="auto" ;;
    esac
    echo "$VRAM_MODE" > "$VRAM_CONFIG_FILE"
    echo ""
fi

# Build VRAM flag
if [ "$VRAM_MODE" = "auto" ]; then
    DETECTED=$(detect_vram_mode)
    VRAM_FLAG=$(get_vram_flag "$DETECTED")
else
    VRAM_FLAG=$(get_vram_flag "$VRAM_MODE")
fi

# Load custom flags if they exist
CUSTOM_FLAGS=""
if [ -f ".comfyui_flags_config" ]; then
    CUSTOM_FLAGS=$(cat ".comfyui_flags_config")
fi

# ── ROCm environment ────────────────────────────────────────────────
# Values written by the installer (GPU arch, ROCm version). Optional user
# overrides can be placed in .cei_amd_env, e.g.
#   HSA_OVERRIDE_GFX_VERSION=11.0.0
if [ -f ".cei_amd_env" ]; then
    # shellcheck disable=SC1091
    . ./.cei_amd_env
fi

export HIP_VISIBLE_DEVICES="${HIP_VISIBLE_DEVICES:-0}"
# Let the HIP allocator reuse freed blocks instead of fragmenting GTT/VRAM
export PYTORCH_HIP_ALLOC_CONF="${PYTORCH_HIP_ALLOC_CONF:-expandable_segments:True}"
export PYTORCH_ALLOC_CONF="${PYTORCH_ALLOC_CONF:-expandable_segments:True}"
# MIOpen: fast convolution lookup, persistent kernel cache per install
export MIOPEN_FIND_MODE="${MIOPEN_FIND_MODE:-FAST}"
export MIOPEN_USER_DB_PATH="${MIOPEN_USER_DB_PATH:-$PWD/.miopen_cache}"
export MIOPEN_CUSTOM_CACHE_DIR="${MIOPEN_CUSTOM_CACHE_DIR:-$PWD/.miopen_cache}"
mkdir -p "$MIOPEN_USER_DB_PATH" 2>/dev/null || true
# Enable AOTriton flash-attention kernels on RDNA3/RDNA3.5 (gfx11xx)
export TORCH_ROCM_AOTRITON_ENABLE_EXPERIMENTAL="${TORCH_ROCM_AOTRITON_ENABLE_EXPERIMENTAL:-1}"
# Uncomment if your APU hangs under load (disables SDMA copy engine):
# export HSA_ENABLE_SDMA=0

# Use PyTorch's native SDPA backend on ROCm unless the user picked another one
ATTN_FLAG="--use-pytorch-cross-attention"
case "$CUSTOM_FLAGS" in
    *attention*|*attn*) ATTN_FLAG="" ;;
esac

ROCm_INFO=$("$PYTHON_EXEC" -c "import torch; hip=torch.version.hip or 'none'; name=torch.cuda.get_device_name(0) if torch.cuda.is_available() else 'GPU not available'; print(f'{torch.__version__} | HIP {hip} | {name}')" 2>/dev/null)

# Launch ComfyUI
clear
print_header
echo -e "${CYAN}🚀 Launching ComfyUI...${RESET}"
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
if [ -n "$ROCm_INFO" ]; then
    echo -e "${GREEN}   ✓ Torch: ${YELLOW}${ROCm_INFO}${RESET}"
else
    echo -e "${YELLOW}   ⚠ Could not query the ROCm torch stack; starting anyway${RESET}"
fi
if [ -n "$HSA_OVERRIDE_GFX_VERSION" ]; then
    echo -e "${GREEN}   ✓ HSA_OVERRIDE_GFX_VERSION=${YELLOW}${HSA_OVERRIDE_GFX_VERSION}${RESET}"
fi
echo ""

# Build command with optional output directory
if [ -n "$custom_output_dir" ]; then
    echo -e "${GREEN}   ✓ Using custom output: ${YELLOW}${custom_output_dir}${RESET}"
    echo -e "${GREEN}   ✓ Listening on: ${YELLOW}${LISTEN_ADDRESS}${RESET}"
    echo -e "${GREEN}   ✓ Using Python: ${YELLOW}$PYTHON_EXEC${RESET}"
    echo ""
    sleep 0.5
$PYTHON_EXEC -W ignore::FutureWarning -W ignore::UserWarning:pydantic._internal._fields ComfyUI/main.py --output-directory "$custom_output_dir" --listen "$LISTEN_ADDRESS" $VRAM_FLAG $ATTN_FLAG $CUSTOM_FLAGS "$@"
else
    echo -e "${GREEN}   ✓ Using default output directory${RESET}"
    echo -e "${GREEN}   ✓ Listening on: ${YELLOW}${LISTEN_ADDRESS}${RESET}"
    echo -e "${GREEN}   ✓ Using Python: ${YELLOW}$PYTHON_EXEC${RESET}"
    echo ""
    sleep 0.5
$PYTHON_EXEC -W ignore::FutureWarning -W ignore::UserWarning:pydantic._internal._fields ComfyUI/main.py --listen "$LISTEN_ADDRESS" $VRAM_FLAG $ATTN_FLAG $CUSTOM_FLAGS "${@}"
fi

echo ""
echo -e "${MAGENTA}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${YELLOW}✨ ComfyUI session ended ✨${RESET}"
echo ""
echo -e "${GREEN}Press any key to exit...${RESET}"
read -n 1 -s
