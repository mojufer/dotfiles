# dotfiles
Dotfiles for my swaywm setup.
**Please report any published dotfiles which shouldn't be published for security or privacy reasons.**

# Dependencies
**Not complete yet**
## Arch Linux
From a base Arch install with yay installed, you need to install following packages.
If some packages can't be installed with pacman, they are in the AUR
```
sudo pacman -S sway neovim gammastep kitty ly pulseaudio pulseaudio-alsa pulseaudio-bluetooth swayidle swaylock swaync waybar wmenu polkit-gnome
yay -S whitesur-gtk-theme whitesur-icon-theme
```

# Apps I use
Here are some apps I use which aren't required for this config to work but are nice to have (if don't use some of them, you may have to modify the defaults apps and keybindings in ```.config/sway/config``` and remove some execution in ```.config/sway/config```)

For my fellow Swiss people, here is a fantastic CLI client for the SBB API : [cff-cli](https://github.com/goeil/cff-cli)

## Arch Linux
If some packages can't be installed with pacman, they are in the AUR
```
sudo pacman -S thunar fish htop ncdu duplicity deja-dup glow nextcloud-client gnome-keyring seahorse signal-desktop thunderbird tree zathura discord blueman fastfetch
yay -S brave-bin free42 vlc-git vscodium-bin sway-interactive-screenshot wdisplays
```

# Installation
Clone the repository on your system : 
```
git clone https://github.com/mojufer/dotfiles.git`
cd dotfiles
```

Then execute the *linking.sh* script to link the dotfiles from this repo to the location where they will be used by your system. **The script is not done yet, use it at your own risk !**.
This will create links, which means that when there is updates and you do ```git pull``` to grab the new changes, your config will be automatically updated. If you want to copy the files instead of creating links, use the ```--copy``` flag.
```
sh linking.sh
```

## Wallpaper
To avoid errors in the sway config, you have to set a wallpaper.  
Do this by using the *wallpaper* utility present in *software/*
```
wallpaper --init # DO THIS ONLY IF YOU UNDERSTAND WHAT IT DOES
wallpaper path_to_wallpaper_file
```
Then reload the sway config (Super+Shift+C) and it should work.
