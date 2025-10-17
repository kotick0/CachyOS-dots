# ~/.bash_profile

# Source .bashrc if it exists (keeps aliases and env vars)
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Only start Hyprland on tty1
if [ "$(tty)" = "/dev/tty1" ]; then
    # Ensure we're not already inside a graphical session
    if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ]; then
        echo "Starting Hyprland..."
        exec Hyprland
    fi
fi
