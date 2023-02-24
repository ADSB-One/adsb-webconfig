#!/bin/bash

log=/adsb/adsb-update.log
rm -f $log
exec &> >(tee -a "$log")

export DEBIAN_FRONTEND=noninteractive
apt update
#apt upgrade -y

bash -c "$(wget -nv -O - https://raw.githubusercontent.com/ADSB-One/adsb-update/main/update-adsb.sh)"
bash -c "$(wget -nv -O - https://raw.githubusercontent.com/ADSB-One/adsb-webconfig/master/update-webconfig.sh)"

echo "rebooting..."
sleep 5
reboot now
