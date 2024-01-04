#!/bin/sh

gopkg="$(curl https://go.dev/VERSION?m=text | head -n1).linux-arm64.tar.gz"
wget -O "/tmp/$gopkg" -nc "https://go.dev/dl/$gopkg"
if [ -e "/tmp/$gopkg" ]; then
	rm -rf /usr/local/go && tar -vC /usr/local -xzf "/tmp/$gopkg" && echo "Run export PATH=$PATH:/usr/local/go/bin"
fi
