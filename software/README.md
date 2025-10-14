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

# win11
Script to automatically launch a Windows 11 vm with virt-viewer.  
See [this note](../resources/windows11_vm.md) for the initial setup.

# headless-monitor
Script to use an iPad with a VNC client as a second monitor.
