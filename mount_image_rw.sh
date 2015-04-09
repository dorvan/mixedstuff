IMAGEPATH=/System
STORAGENAME=cfg
DEVICEID=nbd0
DEVICEPART=nbd0p1

qemu-nbd --connect=/dev/$DEVICEID $IMAGEPATH/$STORAGENAME.qed
kpartx -a /dev/$DEVICEID
sleep 1
mkdir /Data/$STORAGENAME
mount /dev/mapper/$DEVICEPART /$STORAGENAME

IMAGEPATH=/System
STORAGENAME=SystemDataRepo
DEVICEID=nbd1
DEVICEPART=nbd1p1

qemu-nbd --connect=/dev/$DEVICEID $IMAGEPATH/$STORAGENAME.qed
kpartx -a /dev/$DEVICEID
sleep 1
mkdir /Data/$STORAGENAME
mount /dev/mapper/$DEVICEPART /Data/$STORAGENAME

IMAGEPATH=/System
STORAGENAME=SystemDEV
DEVICEID=nbd2
DEVICEPART=nbd2p1

qemu-nbd --connect=/dev/$DEVICEID $IMAGEPATH/$STORAGENAME.qed
kpartx -a /dev/$DEVICEID
sleep 1
mkdir /Data/$STORAGENAME
mount /dev/mapper/$DEVICEPART /Data/$STORAGENAME


