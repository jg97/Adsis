file{'/etc/auto.direct':
		mode => '0644',
		content =>"/home -fstype=nfs,sec=krb5 nfsk1.2.6.ff.es.eu.org:/home
",
}
file{'/etc/auto.master':
		mode => '0644',
		content =>"
/misc	/etc/auto.misc

/net	-hosts

+dir:/etc/auto.master.d

+auto.master
/-	auto.direct
",
}
