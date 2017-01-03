#!/bin/sh

# Setup masquerade, to allow using the container as a gateway
for iface in $(ip a | grep eth | grep inet | awk '{print $2}'); do
  iptables -t nat -A POSTROUTING -s "$iface" -j MASQUERADE
done

echo "------------ VPN Starts ------------"
#/usr/bin/forticlient
/21v.sh

echo "------------ Diagnose VPN ------------"
sleep 10
ps -ef | grep forti
ifconfig -a
netstat -rn
ping -c3 api.stage1.chinabluemix.net

echo "Begin infinite looping"
while [ true ] ; do
  sleep 10
done
