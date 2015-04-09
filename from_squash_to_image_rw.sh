IMAGEPATH=/System
STORAGENAME=SystemDEV
DEVICEID=nbd2
DEVICEPART=nbd2p1
DEVICESIZE=1G


mkdir -p /Data/migrate/$STORAGENAME.roimagedir
mount $IMAGEPATH/$STORAGENAME.squash.xz /Data/migrate/$STORAGENAME.squashdir

qemu-img create -f qed $IMAGEPATH/$STORAGENAME.qed $DEVICESIZE
qemu-nbd --connect=/dev/$DEVICEID $IMAGEPATH/$STORAGENAME.qed
kpartx -a /dev/$DEVICEID
parted -a optimal /dev/$DEVICEID mklabel gpt 
parted -a optimal /dev/$DEVICEID mkpart $STORAGENAME ext4 0% 100%
kpartx -a /dev/$DEVICEID
mkfs.ext4 -L $STORAGENAME /dev/mapper/$DEVICEPART 
mkdir /Data/migrate/$STORAGENAME.rwimagedir
mount /dev/mapper/$DEVICEPART  /Data/migrate/$STORAGENAME.rwimagedir
rsync -aHAz /Data/migrate/$STORAGENAME.roimagedir/ /Data/migrate/$STORAGENAME.rwimagedir/
sleep 1
umount /Data/migrate/$STORAGENAME.roimagedir/
umount /Data/migrate/$STORAGENAME.rwimagedir/
mount /dev/mapper/$DEVICEPART /Data/migrate/$STORAGENAME
