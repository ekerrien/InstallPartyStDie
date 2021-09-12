#!/bin/bash

# run as sudo

# retrieve EFI partition
d=$(df -k / | grep '^/dev' | awk '{print substr($1,1,length($1)-1)}')

# get the UUID
u=$(blkid $d1 | sed 's/.*UUID=\(.*\) .*/\1/')

# replace the UUID for /boot/efi in /etc/fstab
awk '/^UUID.*\/boot\/efi/ {$1="UUID="'$u'} {print} /etc/fstab > /tmp/fstab
mv /tmp/fstab /etc/fstab

# fix EFI partition, and reinstall grub
rm -rf /boot/efi/EFI/ubuntu
umount /boot/efi
mount $d1 /boot/efi
grub-install -d /usr/lib/grub/x86_64-efi --efi-directory=/boot/efi/ --removable $d
