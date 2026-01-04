# ~/.bash_profile

# Source .bashrc if it exists (keeps aliases and env vars)
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# --- Detect NVIDIA GPU ---
#if lspci | grep -qi nvidia; then
# --- NVIDIA + Wayland variables ---
#  export NVD_BACKEND=direct
#  export ELECTRON_OZONE_PLATFORM_HINT=auto
#  export WLR_RENDERER_ALLOW_SOFTWARE=0
#  export __NV_PRIME_RENDER_OFFLOAD=1
#  export __VK_LAYER_NV_optimus=NVIDIA_only
#fi

# --- Start Hyprland only on TTY1 ---
#if [ "$(tty)" = "/dev/tty1" ]; then
    # Ensure we're not already inside a graphical session
#    if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ]; then
#        echo "Starting Hyprland..."
#        exec start-hyprland
#    fi
#fi



# Added by Toolbox App
export PATH="$PATH:/home/kotecku/.local/share/JetBrains/Toolbox/scripts"

