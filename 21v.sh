#!/usr/bin/expect -f
set timeout -1
spawn screen -S 21v /opt/forticlient-sslvpn/64bit/forticlientsslvpn_cli --server 124.251.96.4:443 --vpnuser wlwwang@cn.ibm.com
expect "Password for VPN:"
send "Page11up\r"
expect "Would you like to connect to this server? (Y/N)"
send "y\r"
expect "STATUS::Tunnel running"
send "\01d"
interact
