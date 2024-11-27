# dotfiles
Dotfiles for my Linux setup
Please report any published dotfiles which should be published for security reason.


# Installation
Clone the repository on your system : 
```
git clone https://github.com/mojufer/dotfiles.git`
```

Then execute the *linking.sh* script to link the dotfiles from this repo to the location where they will be used by your system. **The script is not done yet, use it at your own risk !**.
This will create links, which means that when there is updates and you do ```git pull``` to grab the new changes, your config will be automatically updated. If you want to copy the files instead of creating links, use the ```--copy``` flag.
```
sh linking.sh
```
