#!/bin/sh

# see /etc/dphys-swapfile
dphys-swapfile swapoff
dphys-swapfile setup
dphys-swapfile swapon
