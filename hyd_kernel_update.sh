#env EXTRA_ECONF='--enable-linux-builtin' ebuild /ports/portage/sys-kernel/spl/spl-9999.ebuild clean configure
#(cd /ports/tmp/portage/sys-kernel/spl-9999/work/spl-9999 && ./copy-builtin /usr/src/linux)
#env EXTRA_ECONF='--with-spl=/usr/src/linux --enable-linux-builtin' ebuild /ports/portage/sys-fs/zfs-kmod/zfs-kmod-9999.ebuild clean configure
#(cd /ports/tmp/portage/sys-fs/zfs-kmod-9999/work/zfs-kmod-9999/ && ./copy-builtin /usr/src/linux)
genkernel all --kernel-config=/usr/src/.config --clean --mrproper --color --save-config --symlink --all-ramdisk-modules --lvm --mdadm --luks --firmware --firmware-dir=/lib64/firmware --busybox --menuconfig --postclear --compress-initramfs --compress-initrd --compress-initramfs-type=best --gpg --e2fsprogs --zfs --udev --btrfs
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


