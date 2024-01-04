#!/bin/sh

# the debian package pulls a huge amount of crap, so install manually

# dependencies
apt install gnupg

cd /opt && git clone "https://git.zx2c4.com/password-store"
cd /opt/password-store && make install
