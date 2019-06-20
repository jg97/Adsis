file{'/etc/resolv.conf':
        ensure =>'present',
		mode => '0644',
		content =>"search 2.6.ff.es.eu.org
nameserver 2001:470:736b:621::2
nameserver 2001:470:736b:621::3
",
}
file{'/etc/sysconfig/network-scripts/ifcfg-eth0':
		mode => '0644',
	    content =>"TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
DEFROUTE=\”yes\”
IPV4_FAILURE_FATAL=\”no\”
IPV6INIT=no
NAME=eth0
UUID=7f2813c5−c37c−4b77−ac7c−3b0dc20651e7
DEVICE=eth0
ONBOOT=yes
IPV6_PRIVACY=\”no\”
",
}
file{'/etc/sysconfig/network-scripts/ifcfg-eth0.622':
		mode => '0644',
	    content =>"VLAN=yes
TYPE=vlan
DEVICE=eth0.622
PHYSDEV=eth0
VLAN_ID=622
REORDER_HDR=yes
GVRP=no
MVRP=no
PROXY_METHOD=none
BROWSER_ONLY=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
DNS1=2001:470:736b:621::2
DNS2=2001:470:736b:621::3
DOMAIN=2.6.ff.es.eu.org
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable−privacy
NAME=eth0.622
UUID=408ef4a5−c2a7−499a−a5f8−ced9296b3ca5
ONBOOT=yes
",
}
file{'/etc/hostname':
		ensure =>'present',
		mode => '0644',
	    content =>"cliente2.2.6.ff.es.eu.org
",
}
file{'/etc/hosts':
		ensure =>'present',
		mode => '0644',
	    content =>"::1 localhost local localhost6 local6
",
}
