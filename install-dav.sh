#!/bin/sh

apt install xandikos
useradd -d /home/dav dav && sudo -u dav mkdir -p "/home/dav/.local/share/xandikos"
