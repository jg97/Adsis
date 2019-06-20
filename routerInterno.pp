file{'/etc/resolv.conf':
        ensure =>'present',
		mode => '0644',
		content =>"nameserver 2001:470:736b:6ff::2
",
}
file{'/etc/ntpd.conf':
        ensure =>'present',
		mode => '0644',
	    content =>"servers 2001:470:736b:6ff::2
",
}

file{'/etc/rc.conf.local':
        ensure =>'present',
		mode => '0644',
	    content =>"pflogd_flags=NO
sndiod_flags=NO
nsd_flags=\"\"
pf=NO
ntpd_flags=\"-s\"
rad_flags=\"\"
sndiod_flags=NO
",
}
file{'/etc/hostname.vlan620':
		mode => '0644',
	    content =>"inet6 alias 2001:470:736b:620::2 64 vlan 620 vlandev vio0 up
-autoconfprivacy
",
}
file{'/etc/hostname.vlan621':
		mode => '0644',
	    content =>"inet6 alias 2001:470:736b:621::1 64 vlan 621 vlandev vio0 up
-autoconfprivacy
",
}
file{'/etc/hostname.vlan622':
		mode => '0644',
	    content =>"inet6 alias 2001:470:736b:622::1 64 vlan 622 vlandev vio0 up
-autoconfprivacy
",
}
file{'/etc/hostname.vio0':
		ensure =>'present',
		mode => '0644',
	    content =>"-inet6
up
-autoconfprivacy",
}
file{'/etc/sysctl.conf':
		mode => '0644',
	    content =>"net.inet6.ip6.forwarding=1
",
}
file{'/etc/mygate':
		ensure =>'present',
		mode => '0644',
	    content =>"2001:470:736b:620::1
",
}
file{'/etc/myname':
		ensure =>'present',
		mode => '0644',
	    content =>"router62.6.ff.es.eu.org
",
}
file{'/etc/rad.conf':
		mode => '0644',
	    content =>"interface vlan621
interface vlan622
",
}
