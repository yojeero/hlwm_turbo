<h1 align="center">

Herbstluftwm 🐧 Dotfiles

<img alt="Arch" src="https://img.shields.io/badge/Arch-0064b5?logo=arch-linux&logoColor=fff&style=for-the-badge" height="40"/><img alt="Linux" src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" height="40"/>

###

<img src="screen/1.png" alt="Preview" width="50%" max-width="800px"><img src="screen/2.png" alt="Preview" width="50%" max-width="800px">
<img src="screen/3.png" alt="Preview" width="50%" max-width="800px"><img src="screen/4.png" alt="Preview" width="50%" max-width="800px">

</h1>

## Kanagawa Theme

### Login via TTY / Startx via Fish

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

```bash
archinstall

on the step - profile - select > desktop > bspwm
```

#### 2. After installing > reboot and update system

```bash
sudo pacman -Syu

sudo pacman -S \
    xorg-server xorg-xinit \
    xorg-xrandr xorg-xset xorg-xsetroot
```

#### 3. Installing Herbstluftwm and basic utilities

```bash
sudo pacman -S \
    herbstluftwm \
    alacritty polybar rofi picom feh \
    maim slop xclip dunst i3lock
```

Give execution rights to configuration scripts:

```bash
chmod +x ~/.config/herbsluftwm/autostart
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/hlwm-polybar/hlwm-tags.sh
```

#### 4. Installing basic applications and dependencies

```bash
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

```bash
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

#### Another used Dots, Icons, Themes ...

> [!IMPORTANT]
> [yojeero/config_linux](https://github.com/yojeero/config_linux)

#### Hide & show polybar & windows fix

> [!IMPORTANT]
> use keybinding
> `super + b `

#### Folder for screenshots

> [!IMPORTANT]
> Create folder **Screen** for saving screenshots via maim.   

#### .xinitrc   

> [!IMPORTANT]
> if start **Single WM** via .xinitrc - at the end > insert

```bash
exec herbstluftwm
```

> if start **Several WM** via .xinitrc - at the end > insert

```bash
case "$1" in
    herbstluftwm|hlwm)
        exec herbstluftwm
        ;;
    bspwm|*)
        exec bspwm
        ;;
esac
```

> for usefull insert alias in the config.fish

```bash
# login session
abbr -a sx-bspwm 'startx'
abbr -a sx-hlwm 'startx ~/.xinitrc herbstluftwm'
```   

### Login for Single WM 
> Arch Linux > login > pass   

### Login for Several WM 
> Arch Linux > login > pass > sx-hlwm
