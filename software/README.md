# wallpaper
Use the ```--init``` function only if you understand what it does.

## Usage
```
wallpaper path_to_wallpaper_file
```
This work together with following lines in the sway config :
```
set $wallpaper `wallpaper --get-wallpaper-name`
output * bg $wallpaper fill
```
