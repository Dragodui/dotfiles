source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end


# Added by Antigravity CLI installer
set -gx PATH "/home/aksandr/.local/bin" $PATH
alias zed="zeditor"
zoxide init fish --cmd cd | source

# mimocode
fish_add_path /home/aksandr/.mimocode/bin
set -gx CHROME_EXECUTABLE /usr/bin/google-chrome-stable
set -gx QT_QPA_PLATFORM xcb

# Android SDK
set -gx ANDROID_HOME "$HOME/Android/Sdk"
fish_add_path "$ANDROID_HOME/platform-tools"
fish_add_path "$ANDROID_HOME/emulator"

# opencode
fish_add_path /home/aksandr/.opencode/bin
