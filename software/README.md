# wallpaper
Use the ```--init``` function only if you understand what it does.

## Usage
```
wallpaper --init # USE ONLY IF YOU UNDERSTAND THIS FUNCTION
wallpaper path_to_wallpaper_file
```
This work together with following lines in the sway config :
```
set $wallpaper `wallpaper --get-wallpaper-name`
output * bg $wallpaper fill
```

# threshold-bypass
Bypasses the battery charge thresholds found in ```/sys/class/power_supply/BAT0``` and ```/sys/class/power_supply/BAT1``` (for a laptop with two batteries). Reset them after script is closed.
