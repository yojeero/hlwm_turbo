<h1 align="center">

Herbstluftwm 🐧 Dotfiles

<img alt="Arch" src="https://img.shields.io/badge/Arch-0064b5?logo=arch-linux&logoColor=fff&style=for-the-badge" height="40"/><img alt="Linux" src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" height="40"/>

###

<img src="screen/1.png" alt="Preview" width="50%" max-width="800px"><img src="screen/2.png" alt="Preview" width="50%" max-width="800px">
<img src="screen/3.png" alt="Preview" width="50%" max-width="800px"><img src="screen/4.png" alt="Preview" width="50%" max-width="800px">

</h1>

## Kanagawa Theme

<img alt="Linux" src="https://img.shields.io/badge/Linux-ffc425?style=for-the-badge&logo=linux&logoColor=black" height="24"/><img alt="Gentoo" src="https://img.shields.io/badge/Gentoo-6c5ce7?style=for-the-badge&logo=gentoo&logoColor=white" height="24"/><img alt="Debian" src="https://img.shields.io/badge/Debian-de324c?style=for-the-badge&logo=debian&logoColor=white" height="24"/><img alt="Suse" src="https://img.shields.io/badge/Suse-6ab04c?logo=opensuse&logoColor=fff&style=for-the-badge" height="24"/><img alt="Arch" src="https://img.shields.io/badge/Arch-0064b5?logo=arch-linux&logoColor=fff&style=for-the-badge" height="24"/><img alt="Alma" src="https://img.shields.io/badge/Alma-74b9ff?style=for-the-badge&logo=almalinux&logoColor=white" height="24"/>

| **Window Manager** <img width="60"/> | `hlwm` <img width="140"/> |
| :----------------------------------- | :------------------------ |
| **Status bar**                       | `polybar`                 |
| **Terminal**                         | `alacritty`               |
| **Launcher**                         | `rofi`                    |
| **Wallpaper**                        | `feh`                     |
| **Compositor**                       | `picom`                   |
| **Screenshot**                       | `maim`                    |
| **Viewer**                           | `imv`                     |

#### Fonts / Theme

**Symbols Nerd Font** - icons, interface, development.  
**JetBrains Mono** - system font and interface.

**Clear Sans 10** - System Font  
**Kanagawa** - Theme  
**Gruvbox** - Icons

### Installation

#### 1. Boot to the Arch iso

```
archinstall

on the step - profile - select > desktop > minimal
```

#### 2. After installing > reboot and update system

```
sudo pacman -Syu

sudo pacman -S \
    xorg-server xorg-xinit \
    xorg-xrandr xorg-xset xorg-xsetroot
```

#### 3. Installing Herbstluftwm and basic utilities

```
sudo pacman -S \
    herbstluftwm \
    alacritty polybar rofi picom feh \
    maim slop xclip dunst i3lock
```

Give execution rights to configuration scripts:

```
chmod +x ~/.config/herbsluftwm/autostart
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/hlwm-polybar/hlwm-tags.sh
```

#### 4. Installing basic applications and dependencies

```
sudo pacman -S \
    firefox kitty micro mousepad \
    thunar thunar-archive-plugin thunar-volman \
    gvfs udisks2 ntfs-3g tumbler \
    fastfetch mc xarchiver btop \
    p7zip unzip zip tar atool \
    wget git curl xdg-utils ripgrep zoxide \
    xfce4-screenshooter celluloid rhythmbox imv \
    imagemagick ffmpeg lxappearance glib2
```

#### 5. Installing FISH (if want)

```
sudo pacman -S fish eza fzf fd

chsh -s $(command -v fish)
```

#### Home Structure

```text
~/
├── Pictures/
├── Screen/
├── icons/
├── themes/
├── .local/share/fonts/
└── .config/
    ├── herbstluftwm/
    ├── polybar/
    ├── rofi/
    └── picom/
```

#### Used Dots, Icons, Themes, Wallpapers

> [yojeero/config_linux](https://github.com/yojeero/config_linux)

#### Hide/show polybar + full desktop windows

> use keybinding
> `super + b `

#### Folder for screenshots

> Create folder **Screen** for saving screenshots via maim.

---

## Login via TTY

> ### Single WM

#### .xinitrc

> at the end > insert

```
exec herbstluftwm
```

#### config.fish

> at the end > insert

```
if status is-login
    if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
        exec startx
    end
end
```

#### if using BASH

#### .bash_profile

> at the end > insert

```
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
```

#### Login for Single WM

> Arch Linux > login > pass

---

> ### Several WM

#### .xinitrc

> at the end > insert

```
case "$1" in
    herbstluftwm|hlwm)
        exec herbstluftwm
        ;;
    bspwm|*)
        exec bspwm
        ;;
esac
```

#### config.fish

> insert alias for usefull

```
abbr -a sx-bspwm 'startx'
abbr -a sx-hlwm 'startx ~/.xinitrc herbstluftwm'
```

#### Login for Several WM

> Arch Linux > login > pass > sx-hlwm
