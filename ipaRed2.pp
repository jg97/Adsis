file{'/etc/resolv.conf':
        ensure =>'present',
		mode => '0644',
		content =>"search 2.6.ff.es.eu.org
nameserver 2001:470:736b:621::2
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
file{'/etc/sysconfig/network-scripts/ifcfg-eth0.621':
		mode => '0644',
	    content =>"VLAN=yes
TYPE=vlan
DEVICE=eth0.621
PHYSDEV=eth0
VLAN_ID=621
REORDER_HDR=yes
GVRP=no
MVRP=no
PROXY_METHOD=none
BROWSER_ONLY=no
IPV6INIT=yes
IPV6_AUTOCONF=no
IPV6ADDR=2001:470:736b:621::3
IPV6_DEFAULTGW=2001:470:736b:621::1
DNS1=2001:470:736b:621::2
DOMAIN=2.6.ff.es.eu.org
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
IPV6_ADDR_GEN_MODE=stable−privacy
NAME=eth0.621
UUID=408ef4a5−c2a7−499a−a5f8−ced9296b3ca5
ONBOOT=yes
",
}
file{'/etc/hostname':
		ensure =>'present',
		mode => '0644',
	    content =>"ipa2.2.6.ff.es.eu.org
",
}
file{'/etc/hosts':
		ensure =>'present',
		mode => '0644',
	    content =>"::1 localhost local localhost6 local6
2001:470:736b:621::3 ipa2.2.6.ff.es.eu.org ipa2
",
}
