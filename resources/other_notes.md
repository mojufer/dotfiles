# Autostart sway
Sway autostarts on tty1 when the default shell is fish. This works with following lines in config.fish :
```
if status is-interactive
    if test (tty) = "/dev/tty1"
        if not set -q WAYLAND_DISPLAY
            exec sway
        end
    end
end
```

## Avoid putting password for gnome keyring
In seahorse, change the password to blank.


# OBS studio
If someone get to make the screen capture and virtual camera work great on sway / wayland, please give me a tip  

It should work with this :
```
sudo pacman -S obs-studio v4l2loopback-dkms v4l2loopback-utils &
yay -S wlrobs obs-v4l2sink
```


# Power management
```
sudo pacman -S python-typing_extensions &
yay -S auto-cpufreq &
systemctl enable --now auto-cpufreq
```

## Charge treshold
To put the charge thresholds to all the batteries of a laptop to only start charging when the battery is at 40% and stop at 80%, run following commands :
´´´
echo 40 | sudo tee /sys/class/power_supply/BAT*/charge_start_threshold
echo 80 | sudo tee /sys/class/power_supply/BAT*/charge_stop_threshold
´´´


# Vim plugins
We use vim-plug to make the plugins stated in .vimrc work 
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Add the plugins you want in .vimrc and then to ```:PlugInstall``` in vim.


# Pretty decrypt screen / boot screen  with plymouth
I use the [thinkdar](https://github.com/gevera/plymouth_themes/tree/master/thinkpad/thinkdar) theme with every prompt opacity set to 0.
```
sudo pacman -S plymouth &
sudo plymouth-set-default-theme -R thinkdar
```

## Rebuild initramfs
```
sudo vim /etc/mkinitcpio.conf 
    # in HOOKS : put plymouth before encrypt
sudo mkinitcpio -P
```

## Update kernel parameters in bootloader
```
sudo vim /etc/default/grub
    # change GRUB_CMDLINE_LINUX_DEFAULT to "quiet splash loglevel=3 rd.luks.name=<UUID>=cryptroot" 
    # find the UUID of the <luks-partition> with lsblk -f
    # Optionally set timeout to 0
sudo grub-mkconfig -o /boot/grub/grub.cfg
```


# Disable touchscreen on T480
Use following script from [itsmaxymoo](https://gist.github.com/itsmaxymoo/dac5d77eac6d877442be0a792ffb7da0) :
```
#!/bin/bash

# Disable touch screen on Lenovo T480
# This may produce great battery savings
# To re-enable, delete the file created by this script & reboot

DISABLE_TEXT="SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"2a94\", ATTRS{idProduct}==\"464d\", ATTR{authorized}=\"0\""

echo $DISABLE_TEXT | sudo tee -a /etc/udev/rules.d/80-touchscreen.rules
sudo udevadm control --reload-rules && sudo udevadm trigger

echo "Touch screen disabled!"
```

