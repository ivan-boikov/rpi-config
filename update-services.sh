#!/bin/sh

sudo systemctl daemon-reload
sudo systemctl enable proton-bridge.service
sudo systemctl enable udp-tunnel-inside.service
sudo systemctl enable xandikos.service
