#!/bin/sh

# proton uses a more recent golang version than what's in the repo, so get it manually with install-go.sh

useradd -d /home/proton proton || exit
cd /home/proton || exit
sudo -u proton git clone "https://github.com/ProtonMail/proton-bridge" || exit
cd /home/proton/proton-bridge || exit
sudo -u proton PATH=$PATH:/usr/local/go/bin make -j4 build-nogui || exit
