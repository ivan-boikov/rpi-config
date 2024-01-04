#!/bin/sh

cd /opt && git clone --depth 1 "https://github.com/prof7bit/udp-reverse-tunnel"
cd /opt/udp-reverse-tunnel && make clean && make -j4 && make install

# tunnel will run as this user
useradd -d /home/udptunnel udptunnel
