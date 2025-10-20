# ~/.bash_profile

# Source .bashrc if it exists (keeps aliases and env vars)
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# --- Detect NVIDIA GPU ---
if lspci | grep -qi nvidia; then
    # --- NVIDIA + Wayland variables ---
    export WLR_NO_HARDWARE_CURSORS=1
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export LIBVA_DRIVER_NAME=nvidia
    export NVD_BACKEND=direct
    export ELECTRON_OZONE_PLATFORM_HINT=auto
fi

# --- Start Hyprland only on TTY1 ---
if [ "$(tty)" = "/dev/tty1" ]; then
    # Ensure we're not already inside a graphical session
    if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ]; then
        echo "Starting Hyprland..."
        exec Hyprland
    fi
fi

