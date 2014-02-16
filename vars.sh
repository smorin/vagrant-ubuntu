NAME=centos65-x86_64
TYPE=RedHat_64
INSTALLER_PATH="./isos/"
INSTALLER_ISO="CentOS-6.5-x86_64-minimal.iso"
# Default Mac Location of Guest Additions
GUESTADDITIONS_MAC=/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso
GUESTADDITIONS="./isos/VBoxGuestAdditions-4.3.6.iso"
HDD="${HOME}/VirtualBox VMs/${NAME}/main.vdi"
HDD_SWAP="${HOME}/VirtualBox VMs/${NAME}/swap.vdi"
NATNET=10.0.2.0/24

CENTOS_6_4_MINIMAL_URL=http://vault.centos.org/6.4/isos/x86_64/CentOS-6.4-x86_64-minimal.iso
CENTOS_6_5_MINIMAL_URL=http://mirror.rackspace.com/CentOS/6.5/isos/x86_64/CentOS-6.5-x86_64-minimal.iso
