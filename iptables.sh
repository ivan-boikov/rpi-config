#!/bin/sh

#alfa="wlan2"
#dexp="wlan1"
alfa="wlx00c0cab1a40e"
dexp="wlx00e04c3cc4fc"

wan="$alfa"
lan="$dexp"

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables --flush
iptables -A FORWARD -i $wan -o $lan -j ACCEPT
iptables -A FORWARD -i $lan -o $wan -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o $wan -j MASQUERADE
iptables -S

dpkg-reconfigure iptables-persistent
