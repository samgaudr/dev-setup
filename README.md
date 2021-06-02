# Development Setup

Run `./setup-environment.sh` to launch setup.

## Manual Steps

### Mount internal drive

1. Find disk ID with blkid :
```bash
sudo blkid
```

2. Update `/etc/fstab`
```bash
echo "UUID=<DISK_UUID> /mnt/data ntfs defaults,nls=utf8,umask=000,dmask=000,fmask=000,uid=$(id -u),gid=$(id -g) 0 0" | sudo tee -a /etc/fstab
```

**More info :** [fstab](https://askubuntu.com/questions/113733/how-do-i-correctly-mount-a-ntfs-partition-in-etc-fstab) [mask](https://ubuntuforums.org/showthread.php?t=1453342)


## TODO

 - Install latest docker compose version (not fixed version)