#!/bin/bash

##### passwordless sudo
touch /home/vagrant/from_late_command
echo "%sudo   ALL=NOPASSWD: ALL" >> /etc/sudoers

sed -i '/.*requiretty/d' /etc/sudoers
echo '%vagrant ALL=NOPASSWD: ALL' >> /etc/sudoers

#### speed up ssh
echo "UseDNS no" >> /etc/ssh/sshd_config

#### No fsck at boot
sed -i -r 's/(defaults\s+)1 1/\10 0/' /etc/fstab

#### Install vagrant keys[public ssh key for vagrant user]
mkdir -p /home/vagrant/.ssh
cat <<EOM >/home/vagrant/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8Y\
Vr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdO\
KLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7Pt\
ixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmC\
P3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcW\
yLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
EOM

##### setup correct permissions
chmod 755 /home/vagrant/.ssh
chmod 644 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

##### Setup network devices.
rm /etc/udev/rules.d/70-persistent-net.rules
echo '#' >/etc/udev/rules.d/75-persistent-net-generator.rules

##### setup DNS records
cat <<EOM >>/etc/hosts
127.0.0.1   vagrant-ubuntu1204.com vagrant-ubuntu1204
::1         vagrant-ubuntu1204.com vagrant-ubuntu1204
EOM

##### Install pip
/usr/bin/apt-get --yes --force-yes install python-pip

###### install tools
/usr/bin/apt-get --yes --force-yes install linux-headers-generic build-essential dkms

###### VirtualBox Guest Additions
mount -o ro `find /dev/disk/by-label | grep VBOXADDITIONS` /media/cdrom/
sh /media/cdrom/VBoxLinuxAdditions.run
update-rc.d -f vboxadd-x11 remove
umount /media/cdrom

# symlink VBoxGuestAdditions. Otherwise, vagrant will complain that vboxfs is not available.
ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions

###### display login promt after boot
##sed "s/quiet splash//" /etc/default/grub > /tmp/grub
##mv /tmp/grub /etc/default/grub
##update-grub

