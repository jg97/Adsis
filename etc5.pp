file{'/etc/krb5.conf':
        ensure =>'present',
		mode => '0644',
		content =>"#File modified by ipa-client-install

includedir /etc/krb5.conf.d/
includedir /var/lib/sss/pubconf/krb5.include.d/

[libdefaults]
  default_realm = 2.6.FF.ES.EU.ORG
  dns_lookup_realm = false
  dns_lookup_kdc = false
  rdns = false
  dns_canonicalize_hostname = false
  ticket_lifetime = 24h
  forwardable = true
  udp_preference_limit = 0
  allow_weak_crypto = true
  default_ccache_name = KEYRING:persistent:%{uid}


[realms]
  2.6.FF.ES.EU.ORG = {
    kdc = ipa1.2.6.ff.es.eu.org:88
    master_kdc = ipa1.2.6.ff.es.eu.org:88
    admin_server = ipa1.2.6.ff.es.eu.org:749
    kpasswd_server = ipa1.2.6.ff.es.eu.org:464
    default_domain = 2.6.ff.es.eu.org
    pkinit_anchors = FILE:/var/lib/ipa-client/pki/kdc-ca-bundle.pem
    pkinit_pool = FILE:/var/lib/ipa-client/pki/ca-bundle.pem

  }


[domain_realm]
  .2.6.ff.es.eu.org = 2.6.FF.ES.EU.ORG
  2.6.ff.es.eu.org = 2.6.FF.ES.EU.ORG
  nfsk1.2.6.ff.es.eu.org = 2.6.FF.ES.EU.ORG
",
}
file{'/etc/exports':
		mode => '0644',
		content =>"/home  *(rw,sec=krb5:krb5i:krb5p)
",
}
