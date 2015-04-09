IMAGEPATH=/System
STORAGENAME=SystemDEV
DEVICEID=nbd2
DEVICEPART=nbd2p1
DEVICESIZE=1G

qemu-img create -f qed $IMAGEPATH/$STORAGENAME.qed $DEVICESIZE
qemu-nbd --connect=/dev/$DEVICEID $IMAGEPATH/$STORAGENAME.qed
kpartx -a /dev/$DEVICEID
parted -a optimal /dev/$DEVICEID mklabel gpt 
parted -a optimal /dev/$DEVICEID mkpart $STORAGENAME ext4 0% 100%
kpartx -a /dev/$DEVICEID
mkfs.ext4 -L $STORAGENAME /dev/mapper/$DEVICEPART 
mkdir /Data/$STORAGENAME
mount /dev/mapper/$DEVICEPART  /Data/$STORAGENAME
