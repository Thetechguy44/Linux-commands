#Use the lsblk command to list all block devices and identify your flash drive. It will typically be something like /dev/sdX (where X is a letter such as a, b, c, etc.):
lsblk

#If the flash drive is mounted, unmount it using the umount command replace /dev/sdX1 with your flash drive's partition:
sudo umount /dev/sdX1

# use this command to wipe the flash entirely replace /dev/sdX1 with your flash drive's partition:
sudo mkfs -t ext4 /dev/sdX1 

#Use mkfs to format the flash drive. You can format it as ext4, vfat, ntfs, etc. Here are examples:
sudo mkfs.ext4 /dev/sdX1   # For ext4
sudo mkfs.vfat /dev/sdX1   # For FAT32
sudo mkfs.ntfs /dev/sdX1   # For NTFS

