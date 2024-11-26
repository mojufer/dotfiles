#!/bin/sh

# Get the current directory
CURRENT_DIR=$(pwd)

# Backup current config files
mv $HOME/.config $HOME/.config_backup
mv $HOME/.vimrc $HOME/.vimrc_backup

# Backup current ch layout
sudo mv /usr/share/X11/xkb/symbols/ch /usr/share/X11/xkb/symbols/ch_backup

if [ "$1" == "--copy" ]; then
  # Copy files in appropriates folders
  cp $CURRENT_DIR/.vimrc $HOME/.vimrc
  cp -r $CURRENT_DIR/.config/ $HOME/.config/
  sudo cp $CURRENT_DIR/resources/ch /usr/share/X11/xkb/symbols/ch
else
  # Create symlinks for config files
  ln -nfs $CURRENT_DIR/.vimrc $HOME/.vimrc
  cp -rs $CURRENT_DIR/.config/ $HOME/.config/
  sudo ln -nfs $CURRENT_DIR/resources/ch /usr/share/X11/xkb/symbols/ch
fi
