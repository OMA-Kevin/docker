#ssm create --fs xfs -s 100G -p data -n docker_var /dev/sda /dev/sdc /var/lib/docker
mkdir /docker && ssm create --fs xfs -s 1T -p data -n docker_data /dev/sda /dev/sdc /docker

#Filesystem                    1K-blocks    Used  Available Use% Mounted on
#devtmpfs                        4011712       0    4011712   0% /dev
#tmpfs                           4023824     128    4023696   1% /dev/shm
#tmpfs                           4023824    1644    4022180   1% /run
#tmpfs                           4023824       0    4023824   0% /sys/fs/cgroup
#/dev/mapper/fedora_nas-root    65924652 5461168   57091660   9% /
#tmpfs                           4023824      12    4023812   1% /tmp
#/dev/mapper/fedora_nas-home     8125880  283792    7406276   4% /home
#/dev/sdb2                        999320  131892     798616  15% /boot
#/dev/sdb1                        204580    9612     194968   5% /boot/efi
#tmpfs                            804764      16     804748   1% /run/user/1000
#/dev/mapper/data-docker_var   104806400   53296  104753104   1% /var/lib/docker
#/dev/mapper/data-docker_data 1073217536   33008 1073184528   1% /docker



#
# /etc/fstab
# Created by anaconda on Sat Jul  8 14:43:32 2017
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
#/dev/mapper/fedora_nas-root /                       ext4    defaults        1 1
#UUID=0ad9f8fb-7997-4244-b12f-fc598886cfd6 /boot                   ext4    defaults        1 2
#UUID=5143-2483          /boot/efi               vfat    umask=0077,shortname=winnt 0 2
#/dev/mapper/fedora_nas-home /home                   ext4    defaults        1 2
#/dev/mapper/fedora_nas-swap swap                    swap    defaults        0 0
#/dev/mapper/data-docker_var	/var/lib/docker		xfs defaults 0 2
#/dev/mapper/data-docker_data	/docker			xfs defaults 0 2

