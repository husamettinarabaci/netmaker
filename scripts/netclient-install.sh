#!/bin/sh
set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

[ -z "$KEY" ] && KEY=nokey;

wget -O netclient https://github.com/gravitl/netmaker/releases/download/v0.7/netclient
chmod +x netclient
sudo ./netclient register -t $KEY
sudo ./netclient join -t $KEY
rm -f netclient
