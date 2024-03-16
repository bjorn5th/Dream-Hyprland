# Hyprland config

### Notes

 - For the key binding that triggers logout when the power button is pressed to work correctly, set ```HandlePowerKey=ignore``` in /etc/systemd/logind.conf

### installing yay (required package managerr)


```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd # exit from yay directory

```

### For Nvidia cards (Do this before Hyprland install)


```bash
sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-opencl-nvidia opencl-nvidia libxnvctrl
```
- Add in /etc/mkinitcpio.conf
```bash
MODULES=(...nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```
- Generate a new initramfs image
```bash
sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img
```
- Create NVIDIA Configuration
```bash
echo "options nvidia-drm modeset=1" | sudo tee /etc/modprobe.d/nvidia.conf
```
- Verify
```bash
cat /etc/modprobe.d/nvidia.conf
```

  - Shoud return:
  ```bash
  options nvidia-drm modeset=1
  ```
- Reboot
```bash
reboot
```

### If you also have Intel CPU with integrated graphics


```bash
sudo pacman -S lib32-mesa vulkan-intel lib32-vulkan-intel libva-intel-driver xf86-video-intel
```

### installing Hyprland and needed packages


```bash
yay -S hyprland kitty mako waybar swww hyprlock\
wofi wlogout xdg-desktop-portal-hyprland swappy grim slurp thunar librewolf-bin \
polkit-gnome pamixer pavucontrol brightnessctl bluez \
wireplumber pipewire qt5-wayland qt5ct qt6-wayland qt6ct qt5-svg \
qt5-quickcontrols2 qt5-graphicaleffects sddm \
gtk3 papirus-icon-theme nwg-look-bin jq python-requests \
bluez-utils blueman network-manager-applet gvfs thunar-archive-plugin file-roller htop \
pacman-contrib starship ttf-jetbrains-mono-nerdt tf-nerd-fonts-symbols	ttf-nerd-fonts-symbols-mono\
noto-fonts-emoji lxappearance xfce4-settings sddm-sugar-candy-git
```
### List of the packages that would be installed

- hyprland: The Hyprland compositor
- kitty: This is the default terminal
- waybar: Status bar
- swww: Desktop background image setting tool
- hyprlock: Session locking tool
- wofi: Application launcher menu
- wlogout: Logout menu that allows for shutdown, reboot and sleep
- mako: GUI notification daemon
- xdg-desktop-portal-hyprland-git: xdg-desktop-portal backend for hyprland
- Screenshot tools:
    - swappy: Screenshot editor tool
    - grim: Screenshot tool that grabs images from a Wayland compositor
    - slurp: Region selector in a Wayland compositor
- File management:
    - thunar: File management
    - thunar-archive-plugin: Provides a front ent for thunar to work with compressed files
    - file-roller: Backend set of tools for working with compressed files
- polkit-gnome: Get superuser access on some graphical application
- python-requests: Execute pyhton scripts
- pamixer: Audio settings tool
    - pavucontrol: GUI for managing audio and audio devices
- brightnessctl: Control monitor and keyboard bright level
- Bluetooth:
    - bluez: the bluetooth service
    - bluez-utils: command line utilities to interact with bluettoth devices
    - blueman: Graphical bluetooth manager
- network-manager-applet: Applet for managing network connection
- gvfs: Adds missing functionality to thunar such as automount usb drives
- htop: Process manager
- pacman-contrib: adds additional tools for pacman. needed for showing system updates in the waybar
- starship: allows to customize the shell prompt
- Fonts:
    - ttf-jetbrains-mono-nerd
    - noto-fonts-emoji
    - ttf-nerd-fonts-symbols
    - ttf-nerd-fonts-symbols-mono
- lxappearance: GTK theme settings
- xfce4-settings: Set of tools for xfce, needed to set GTK theme
- sddm-git: developement version of SDDM which is a display manager for graphical login
- sddm-sugar-candy-git: an sddm theme my theme is based on (copy of)

##### The following projects have inspired me

- https://gitlab.com/stephan-raabe/dotfiles
- https://github.com/SolDoesTech
