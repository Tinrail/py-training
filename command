iptables -I INPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -I INPUT -p tcp -m multiport --dports 80,443 -j ACCEPT
iptables -I INPUT -s 10.0.16.2 -p icmp --icmp 8 -j ACCEPT
iptables -I OUTPUT -p icmp --icmp 0 -j ACCEPT
iptables -I INPUT -s 10.0.244.89 -p tcp --dport 4118 -j ACCEPT
iptables -I INPUT -p tcp --dport 5555 -j ACCEPT
iptables -I INPUT -i lo -j ACCEPT