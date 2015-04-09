mount -o bind /Data/SystemDEV/DIR_lib64_firmware/ /lib64/firmware/
mkdir /lib64/modules/3.16-aufs
mount -o bind /Data/SystemDEV/DIR_lib64_modules_3.16-aufs/ /lib64/modules/3.16-aufs/
mount -o bind /Data/SystemDEV/DIR_usr_lib64_debug /usr/lib64/debug
mount -o bind /Data/SystemDEV/DIR_usr_lib64_gcc /usr/lib64/gcc
mount -o bind /Data/SystemDEV/DIR_usr_lib64_mono /usr/lib64/mono
mount -o bind /Data/SystemDEV/DIR_usr_src /usr/src

