#mount -t tmpfs none /Data
#mount -t tmpfs none /lib64/modules 
mkdir -p /lib64/modules/3.16.7-aufs
mount /System/DIR_lib64_modules_3.16.7-aufs.squash.xz /lib64/modules/3.16.7-aufs
mount /System/DIR_lib64_firmware.squash.xz /lib64/firmware
mount /System/DIR_usr_lib64_mono.squash.xz /usr/lib64/mono
mount /dev/sda5 /ports
mount -t tmpfs none /ports/tmp/portage
env-update
#qemu-img  create -f qed cfgrunning.qed 1G

# CFG
qemu-nbd --connect=/dev/nbd0 /System/cfg.qed
kpartx -a /dev/nbd0
sleep 1
mount /dev/mapper/nbd0p1 /cfg

# SystemDataRepo
qemu-nbd --connect=/dev/nbd1 /System/SystemDataRepo.qed
kpartx -a /dev/nbd1
sleep 1
mount -o bind /System/SystemDataRepo/DIR_framework/ /framework/
mount -o bind /System/SystemDataRepo/DIR_home/ /home/
mount -o bind /System/SystemDataRepo/DIR_home_SYS/ /home/SYS/
mount -o bind /System/SystemDataRepo/DIR_var_account/ /var/account/
mount -o bind /System/SystemDataRepo/DIR_var_amavis/ /var/amavis/
mount -o bind /System/SystemDataRepo/DIR_var_bind/ /var/bind/
mount -o bind /System/SystemDataRepo/DIR_var_cache/ /var/cache/
mount -o bind /System/SystemDataRepo/DIR_var_db_pkg/ /var/db/pkg/
mount -o bind /System/SystemDataRepo/DIR_var_db_sudo/ /var/db/sudo/
mount -o bind /System/SystemDataRepo/DIR_var_db_iscsi/ /var/db/iscsi/
mount -o bind /System/SystemDataRepo/DIR_var_heimdal/ /var/heimdal/
mount -o bind /System/SystemDataRepo/DIR_var_imap/ /var/imap/
mount -o bind /System/SystemDataRepo/DIR_var_spool/ /var/spool/
mount -o bind /System/SystemDataRepo/DIR_var_target/ /var/target/
mount -o bind /System/SystemDataRepo/DIR_var_www/ /var/www/

# SystemDEV
#qemu-nbd --connect=/dev/nbd2 /System/SystemDEV.qed
#kpartx -a /dev/nbd2
#sleep 1
#mount -o bind /System/SystemDEV/DIR_usr_lib64_debug/ /usr/lib64/debug/
#mount -o bind /System/SystemDEV/DIR_usr_lib64_gcc/ /usr/lib64/gcc/
#mount -o bind /System/SystemDEV/DIR_usr_src/ /usr/src/

####
#modprobe lib80211
#modprobe lib80211_crypt_ccmp
#modprobe iwlwifi
#modprobe r8169
#modprobe igb
#modprobe e1000
#modprobe e1000e
#ifconfig eth0 up
#ifconfig eth1 up
#ifconfig eth2 up
#ifconfig eth3 up
#ifconfig eth4 up
#ifconfig wlan0 up
#wpa_supplicant -Dnl80211 -iwlan0 -c/etc/wpa_supplicant/wpa_supplicant.conf&
#sleep 2
#dhclient wlan0
#dhclient eth0
#systemctl restart sshd.service
