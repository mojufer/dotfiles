# Install a Windows 11 VM with KVM/QEMU

My notes on how to do it.

## Install kvm 
```
sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq bridge-utils libguestfs ebtables vde2 openbsd-netcat
```

## Configure service
```
sudo systemctl enable --now libvirtd.service
```
Uncomment in ```/etc/libvirt/libvirtd.conf``` the lines
```
unix_sock_group = "libvirt"
unix_sock_rw_perms = "0770"
```

```
sudo usermod -aG libvirt $USER
sudo systemctl restart libvirtd.service
```


## Install Windows 11 bypassing TPM and Microsoft account
Bypass tpm 2.0 : https://www.tomshardware.com/how-to/bypass-windows-11-tpm-requirement
Bypass Microsoft account : https://www.tomshardware.com/how-to/install-windows-11-without-microsoft-account


# Create shortcut to start it
## Transfert the VM to a non-root user :
```
# Dump VM XML as root
sudo virsh -c qemu:///system dumpxml win11 > win11.xml

# Import as user
virsh -c qemu:///session define win11.xml

# Copy the disk image
sudo cp /var/lib/libvirt/images/win11.qcow2 /home/$(whoami)/.VMs

# Copy the NVRAM
sudo cp /var/lib/libvirt/qemu/nvram/win11_VARS.fd /home/$(whoami)/.libvirt/nvram/
```
Then modify the paths in the VM xml for disk image and nvram.

To finish the transfert, remove and undefine the old VM :
```
sudo virsh -c qemu:///system shutdown win11
sudo virsh -c qemu:///system undefine win11
sudo rm /var/lib/libvirt/images/win11.qcow2
sudo rm /var/lib/libvirt/qemu/nvram/win11_*.fd
sudo rm /var/lib/libvirt/qemu/snapshots/win11-*.qcow2

```

## Create the launch script
Create ```/bin/win11``` with the content from ```dotfiles/resources/win11```.



```
```
```
```
