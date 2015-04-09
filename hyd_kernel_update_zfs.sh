#export EXTRA_ECONF='--enable-linux-builtin --with-linux=/usr/src/linux --with-spl=/usr/src/linux --with-linux-obj=/usr/src/linux'
#cd /usr/src/linux/
#make clean
#make mrproper
#cp /usr/src/.config /usr/src/linux/.config
#make prepare
#emerge -U --oneshot sys-kernel/spl sys-fs/zfs sys-fs/zfs-kmod 
#emerge --oneshot sys-kernel/spl sys-fs/zfs sys-fs/zfs-kmod
ebuild /ports/portage/sys-kernel/spl/spl-9999.ebuild clean configure
cd /ports/tmp/portage/sys-kernel/spl-9999/work/spl-9999
./copy-builtin /usr/src/linux
cd /usr/src/linux
ebuild /ports/portage/sys-fs/zfs-kmod/zfs-kmod-9999.ebuild clean configure
cd /ports/tmp/portage/sys-fs/zfs-kmod-9999/work/zfs-kmod-9999/
./copy-builtin /usr/src/linux
cd /usr/src/linux
#cp /usr/src/linux/.config /usr/src/.config
####
genkernel all --kernel-config=/usr/src/.config --color --save-config --symlink --all-ramdisk-modules --lvm --mdadm --luks --firmware --firmware-dir=/lib64/firmware --busybox --menuconfig --compress-initramfs --compress-initrd --compress-initramfs-type=best --gpg --e2fsprogs --zfs --udev --btrfs --no-mrproper --no-clean
# --clean --mrproper 
### --netboot --unionfs --dmraid --iscsi -gpg --multipath --zfs
### --disklabel --unionfs


# Required Kernel Parameters:
#     real_root=/dev/$ROOT
#
#     Where $ROOT is the device node for your root partition as the
#     one specified in /etc/fstab
#
# If you require Genkernel's hardware detection features; you MUST
# tell your bootloader to use the provided INITRAMFS file. Otherwise;
# substitute the root argument for the real_root argument if you are
# not planning to use the initramfs...

# WARNING... WARNING... WARNING...
# Additional kernel cmdline arguments that #may# be required to boot properly...
# add "vga=791 splash=silent,theme:default console=tty1 quiet" if you use a splash framebuffer ]
# add "dolvm" for lvm support
# add "dodmraid" for dmraid support
#       or "dodmraid=<additional options>"


