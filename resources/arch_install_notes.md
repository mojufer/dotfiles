# Installing Arch Linux with full disk encryption

Make sure system is in UEFI mode (should get an output without errors) :
```
ls /sys/firmware/efi/efivars
```
## Connect to the Internet
```
iwctl
device list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect <SSID>
```

## Wipe disk
```
wipefs -a /dev/<your-disk>
```

## Create partitions with fdisk
```
fdisk /dev/<your-disk>
```
Type *g* to create a new GPT partition table.
Craete the EFI partition : type *n* ; *ENTER* ; *ENTER* ; *+100M* ; *t* ; *uefi*


```
```
```
```
```
```
```
```
```
```
