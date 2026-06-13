# ~/.bash_profile

# Source .bashrc if it exists (keeps aliases and env vars)
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# --- Start Hyprland only on TTY1 ---
if [ "$(tty)" = "/dev/tty1" ]; then
#     Ensure we're not already inside a graphical session
    if [ -z "$WAYLAND_DISPLAY" ] && [ -z "$DISPLAY" ]; then
        echo "Starting Hyprland..."
        exec start-hyprland
    fi
fi



# Added by Toolbox App
export PATH="$PATH:/home/kotecku/.local/share/JetBrains/Toolbox/scripts"
