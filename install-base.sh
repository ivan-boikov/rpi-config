#!/bin/sh

apt update

apt install git stow

apt install network-manager iptables iptables-persistent hostapd unbound wpasupplicant

#sudo apt install cryptsetup samba

# tplink dongle driver, not used anymore
# sudo apt install firmware-atheros

echo "Set SSID and password at /etc/hostapd/hostapd.conf, it will not start otherwise"
