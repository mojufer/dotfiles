# Backup current config files
mv ~/.config ~/.config_backup
mv ~/.vimrc ~/.vimrc_backup

# Backup current ch layout
mv /usr/share/X11/xkb/symbols/ch /usr/share/X11/xkb/symbols/ch_backup

# Create symlinks for config files
ln -nfs ./.vimrc ~/.vimrc
cp -rs ./.config/ ~/.config/
ln -nfs ./resources/ch /usr/share/X11/xkb/symbols/ch
