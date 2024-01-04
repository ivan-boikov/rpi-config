#!/bin/sh

# somehow used during install, but does not fail if it's absent... install just in case
apt install bc

cd /opt && git clone --depth 1 "https://github.com/RinCat/RTL88x2BU-Linux-Driver" "rtl88x2bu"
cd /opt/rtl88x2bu && make clean && make -j4 && make install
