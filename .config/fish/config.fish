set fish_greeting ""

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx MICRO_TRUECOLOR 1

# nano
abbr -a n nano
abbr -a _ sudo
abbr -a _e sudoedit

# eza
abbr -a ld eza -lD
abbr -a lh eza -dl .* --group-directories-first
abbr -a ll eza -al --group-directories-first
abbr -a lt eza -al --sort=modified
abbr -a lf "eza -lF --color=always | grep -v /"
abbr -a ls "eza -alF --color=always --sort=size | grep -v /"

# pnpm
abbr -a ni pnpm install
abbr -a nr pnpm run
abbr -a nd pnpm run dev
abbr -a nb pnpm run build

# Git
abbr -a gs git status
abbr -a gi git init
abbr -a ga git add .
abbr -a gaa git add -A
abbr -a gc git commit -m
abbr -a gd git diff HEAD
abbr -a go git push -u origin
abbr -a gco git checkout

# GNU coreutils
abbr -a diff diff --color=auto
abbr -a df df -h
abbr -a du du -h
abbr -a grep grep --color=auto
abbr -a chmod chmod --preserve-root -v
abbr -a chown chown --preserve-root -v
abbr -a find find

# clear
abbr -a c clear
abbr -a ka killall

# Yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi --cwd-file="$tmp" $argv
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# fzf to config folder
function _fzf_change_directory
    if read -l foo
        if test -n "$foo"
            builtin cd (string unescape -- $foo)
            commandline -r ''
            commandline -f repaint
        end
    else
        commandline ''
    end
end

function fzf_change_directory
    begin
        # config folder
        echo $HOME/.config        
        # Search for ghq repos
        if type -q ghq
            # Searches for .git folders inside the ghq root up to 4 levels
            string match -r '.*/[^/]+' (ghq root)/**/.git | string replace '/.git' ''
        end        
        #. Current eza subfolders
        eza -d */ 2>/dev/null | string replace -r '/$' '' | string match -v '*.git*'
        # КРИТИЧЕСКОЕ ИСПРАВЛЕНИЕ 3: Исправлен синтаксис поиска в Developments (добавлен echo)
        if test -d $HOME/Developments
            string match -v '*.git*' (echo $HOME/Developments/*/*)
        end
    end | string match -r '.+' | uniq | fzf | _fzf_change_directory
end

# Purpose of the Ctrl + G key
bind \cg fzf_change_directory

# Import Gentoo system environment 
if test -f /etc/profile.env
    sed -E 's/^export ([A-Za-z0-9_]+)=(.*)$/set -gx \1 \2/' /etc/profile.env | source
end

# Interactive session selection when logging into TTY1
if status is-interactive; and test (tty) = "/dev/tty1"
    echo "==================================="
    echo " Run Hypr or HLWM:   "
    echo " [1] Hyprland (Wayland)              "
    echo " [2] herbstluftwm (X11)           "
    echo " [3] Stay in TTY      "
    echo "==================================="
    
 # Read the user's choice
    read -P "Select [1-3]: " choice

    switch $choice
        case 1
            echo "Start Hyprland (Wayland)..."
            set -gx XDG_CURRENT_DESKTOP Hyprland
            set -gx XDG_SESSION_DESKTOP Hyprland
            set -gx XDG_SESSION_TYPE wayland
            set -gx MOZ_ENABLE_WAYLAND 1
            set -gx QT_QPA_PLATFORM wayland
            
            exec Hyprland

        case 2
            echo "Start herbstluftwm (X11)..."
            # For X11 using ~/.xinitrc
     # We pass the WM name as an argument
            exec startx (which herbstluftwm)

        case 3
            echo "Enter to TTY!"
            
        case '*'
            echo "Bad step. Stay in TTY."
    end
end


 




