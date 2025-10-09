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
```
```
```
```
```
```
