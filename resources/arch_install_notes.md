# Installing Arch Linux with full disk encryption
It is easier to get an ssh connection and then you can copy paste most of the commands (replacing the placeholders like <your-disk>).

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
- Type *g* to create a new GPT partition table.  
- Create the EFI partition : type *n* ; *ENTER* ; *ENTER* ; *+100M* ; *t* ; *uefi*
- Create the boot partition : type *n* ; *ENTER* ; *ENTER* ; *+512M* ; *t* ; *ENTER* ; *linux*  
- Create the LUKS partition : type *n* ; *ENTER* ; *ENTER* ; *ENTER* ; *t* ; *ENTER* ; *linux*  
- Verify partition table : *p*  
- Write changes : *w*  

## Format partitions
```
mkfs.fat -F 32 /dev/<efi-partition> & 
mkfs.ext4 /dev/<boot-partition>
```

## Setup encrypted partition
```
cryptsetup --use-random luksFormat /dev/<luks-partition>
cryptsetup luksOpen /dev/<luks-partition> cryptlvm
```

## Create LVM volume group
```
pvcreate /dev/mapper/cryptlvm &
vgcreate vg0 /dev/mapper/cryptlvm
```

## Create LVM partitions (logical volumes)
Home and root on the same partition.  
We have to leave 256MiB of free space for the e2scrub commands.
```
lvcreate --size 8G vg0 --name swap &
lvcreate -l +100%FREE vg0 --name root &
lvreduce --size -256M vg0/root
```

## Format logical volumes
```
mkswap /dev/vg0/swap &
mkfs.ext4 /dev/vg0/root
```

## Mount new filesystems
```
mount /dev/vg0/root /mnt &
mount --mkdir /dev/<efi-partition> /mnt/efi &
mount --mkdir /dev/<boot-partition> /mnt/boot &
swapon /dev/vg0/swap
```

## Install basic packages
```
pacstrap -K /mnt base linux linux-firmware openssh git vim sudo base-devel linux-headers
```

## Generate /etc/fstab : defines how partitions are mounted into filesystem
```
genfstab -U /mnt >> /mnt/etc/fstab
```

## Enter new system
```
arch-chroot /mnt
```

## Set TimeZone
```
ls /usr/share/zoneinfo &
ln -s /usr/share/zoneinfo/Europe/Zurich /etc/localtime
```

## Generate /etc/adjtime
```
hwclock --systohc
```

## Set locale
```
vim /etc/locale.gen # (uncomment en_US.UFT-8 UTF-8)
locale-gen &
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

## Set hostname
```
echo <your-hostname> > /etc/hostname
```

## Create user
```
useradd -m -G wheel --shell /bin/fish <your-username> &
passwd <your-username>
visudo # (uncomment %wheel ALL=(ALL)
```

## Configure mkinitcpio with modules needed to create the initramfs image
```
pacman -S lvm2 &
vim /etc/mkinitcpio.conf
    # Add "encrypt" and "lvm2" to HOOKS right before "filesystems"
mkinitcpio -P # recreate initramfs image
```

## Setup grub
```
pacman -S grub efibootmgr &
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB &
vim /etc/default/grub
    # change to GRUB_CMDLINE_LINUX="cryptdevice=/dev/<luks-partition>:cryptlvm root=/dev/vg0/root
```

## Generate GRUB config file 
```
grub-mkconfig -o /boot/grub/grub.cfg
```

## Install networkmanager and enable
```
pacman -S networkmanager &
systemctl enable NetworkManager
```

## Exit, umount and reboot
```
exit 
umount -R /mnt 
swapoff -a 
reboot
```





## 







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
