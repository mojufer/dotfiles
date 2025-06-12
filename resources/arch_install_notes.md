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
Create the EFI partition : type *n* ; *ENTER* ; *ENTER* ; *+100M* ; *t* ; *uefi*
Create the boot partition : type *n* ; *ENTER* ; *ENTER* ; *+512M* ; *t* ; *ENTER* ; *linux*  
Create the LUKS partition : type *n* ; *ENTER* ; *ENTER* ; *ENTER* ; *t* ; *ENTER* ; *linux*  
Verify partition table : *p*  
Write changes : *w*  

## Format partitions
```
mkfs.fat -F 32 /dev/<efi-partition>
mkfs.ext4 /dev/<boot-partition>
```

## Setup encrypted partition
```
cryptsetup --use-random luksFormat /dev/<luks-partition>
cryptsetup luksOpen /dev/<luks-partition> cryptlvm
```

## Create LVM volume group
```
pvcreate /dev/mapper/cryptlvm
vgcreate vg0 /dev/mapper/cryptlvm
```

## Create LVM partitions (logical volumes)
Home and root on the same partition.  
We have to leave 256MiB of free space for the e2scrub commands.
```
lvcreate --size 8G vg0 --name swap
lvcreate -l +100%FREE vg0 --name root
lvreduce --size -256M vg0/root
```

## Format logical volumes
```
mkswap /dev/vg0/swap
mkfs.ext4 /dev/vg0/root
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
```
