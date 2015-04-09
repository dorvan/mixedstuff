#Filesystem          1K-blocks     Used Available Use% Mounted on
#/dev/mapper/nbd0p1    1013688     1364    943616   1% /cfg
#/dev/mapper/nbd1p1    2029392   140816   1767440   8% /var/db/pkg
#/dev/mapper/nbd2p1    2029392   145328   1762928   8% /lib64/modules/3.17.0-sabayon
#/dev/mapper/nbd3p1    2029392     3428   1904828   1% /framework
#/dev/mapper/nbd4p1    2029392    44652   1863604   3% /framework/gigasys
#/dev/mapper/nbd5p1    8123832  2475652   5212468  33% /usr/src
#/dev/mapper/nbd6p1    1013688   298196    646784  32% /usr/lib64/debug
#/dev/mapper/nbd7p1    1013688    73000    871980   8% /usr/lib64/gcc
#/dev/mapper/nbd8p1    1013688    82156    862824   9% /lib64/firmware
#/dev/mapper/nbd9p1    4060864     8224   3826644   1% /home
#/dev/mapper/nbd10p1   4060864    46928   3787940   2% /home/SYS

###
mount -t tmpfs none /System/newsquashes/

###
mksquashfs /cfg/* /System/newsquashes/DIR_cfg.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /var/db/pkg/* /System/newsquashes/DIR_var_db_pkg.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /lib64/modules/3.17.0-sabayon/* /System/newsquashes/DIR_lib64_modules_3.17.0-sabayon.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /lib64/modules/3.16.7-aufs/* /System/newsquashes/DIR_lib64_modules_3.16.7-aufs.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /framework/gigasys/* /System/newsquashes/DIR_framework_gigasys.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /usr/src/linux-3.16.7-aufs/* /System/newsquashes/DIR_usr_src_linux-3.16.7-aufs.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /usr/lib64/debug/* /System/newsquashes/DIR_usr_lib64_debug.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /usr/lib64/gcc/* /System/newsquashes/DIR_usr_lib64_gcc.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /lib64/firmware/* /System/newsquashes/DIR_lib64_firmware.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /home/SYS/* /System/newsquashes/DIR_home_SYS.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /usr/lib64/mono/* /System/newsquashes/DIR_usr_lib64_mono.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
mksquashfs /var/* /System/newsquashes/DIR_var.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%

###
#umount /framework/gigasys
#mksquashfs /framework/* /System/newsquashes/DIR_framework.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
#umount /home/SYS
#mksquashfs /home/* /System/newsquashes/DIR_home.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%
#rm -fR /usr/src/linux-3.16.7-aufs
#mksquashfs /usr/src/* /System/newsquashes/DIR_usr_src.squash.xz -comp xz -Xbcj x86 -Xdict-size 75%

