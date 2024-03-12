# Hyprland config

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
yay -S hyprland kitty mako waybar swww swaylock-effects \
wofi wlogout xdg-desktop-portal-hyprland swappy grim slurp thunar librewolf-bin \
polkit-kde-agent pamixer pavucontrol brightnessctl bluez \
wireplumber pipewire qt5-wayland qt5ct qt6-wayland qt6ct qt5-svg \
qt5-quickcontrols2 qt5-graphicaleffects sddm \
gtk3 papirus-icon-theme nwg-look-bin jq python-requests \
bluez-utils blueman network-manager-applet gvfs thunar-archive-plugin file-roller btop \
pacman-contrib starship ttf-jetbrains-mono-nerdt tf-nerd-fonts-symbols	ttf-nerd-fonts-symbols-mono\
noto-fonts-emoji lxappearance xfce4-settings sddm-sugar-candy-git
```
