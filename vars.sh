NAME=ubuntu1204-x86_64
TYPE=Ubuntu_64
INSTALLER_PATH="./isos/"
INSTALLER_ISO="ubuntu-12.04.4-alternate-amd64.iso"
GUESTADDITIONS_PATH=""
OS_NAME=`uname`
IP=''
UBUNTU_ISO_MD5HASH="46e0fac240154bf59a11426a47a61363"

#Determining OS and setting VBoxGuestAdditions default path accordingly
if [ $OS_NAME=="Linux" ]; then
    # Default Linux Location of Guest Additions
	GUESTADDITIONS_PATH=/usr/share/virtualbox/VBoxGuestAdditions.iso
elif [ $OS_NAME=="Darwin"]; then
	# Default MAC Location of Guest Additions
	GUESTADDITIONS_PATH=/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso
else
	echo "ERROR: Couldn't determine VBoxGuestAdditions path!!!.Find manually and update vars.sh with the right path. Aborting..."
	exit 1
fi

GUESTADDITIONS="./isos/VBoxGuestAdditions-4.3.6.iso"
HDD="${HOME}/VirtualBox VMs/${NAME}/main.vdi"
HDD_SWAP="${HOME}/VirtualBox VMs/${NAME}/swap.vdi"

# Determining IP address of current host
if [ $OS_NAME == "Linux" ]; then
	IP=`hostname -I | cut -d' ' -f1`
else
	IP=10.0.2.3
fi

NATNET=10.0.2.0/24

UBUNTU_12_04_ALTERNATE_URL=http://releases.ubuntu.com/precise/ubuntu-12.04.4-alternate-amd64.iso
