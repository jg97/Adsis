file{'/etc/zabbix/zabbix_server.conf':
		ensure => 'present',
		mode => '0644',
		content =>"# This is a configuration file for Zabbix server daemon
# To get more information about Zabbix, visit http://www.zabbix.com

############ GENERAL PARAMETERS #################

### Option: ListenPort
#	Listen port for trapper.
#
# Mandatory: no
# Range: 1024-32767
# Default:
# ListenPort=10051

### Option: SourceIP
#	Source IP address for outgoing connections.
#
# Mandatory: no
# Default:
# SourceIP=

### Option: LogType
#	Specifies where log messages are written to:
#		system  - syslog
#		file    - file specified with LogFile parameter
#		console - standard output
#
# Mandatory: no
# Default:
# LogType=file

### Option: LogFile
#	Log file name for LogType 'file' parameter.
#
# Mandatory: yes, if LogType is set to file, otherwise no
# Default:
# LogFile=

LogFile=/var/log/zabbix/zabbix_server.log

### Option: LogFileSize
#	Maximum size of log file in MB.
#	0 - disable automatic log rotation.
#
# Mandatory: no
# Range: 0-1024
# Default:
# LogFileSize=1

LogFileSize=0

### Option: DebugLevel
#	Specifies debug level:
#	0 - basic information about starting and stopping of Zabbix processes
#	1 - critical information
#	2 - error information
#	3 - warnings
#	4 - for debugging (produces lots of information)
#	5 - extended debugging (produces even more information)
#
# Mandatory: no
# Range: 0-5
# Default:
# DebugLevel=3

### Option: PidFile
#	Name of PID file.
#
# Mandatory: no
# Default:
# PidFile=/tmp/zabbix_server.pid

PidFile=/var/run/zabbix/zabbix_server.pid

### Option: SocketDir
#	IPC socket directory.
#		Directory to store IPC sockets used by internal Zabbix services.
#
# Mandatory: no
# Default:
# SocketDir=/tmp

SocketDir=/var/run/zabbix

### Option: DBHost
#	Database host name.
#	If set to localhost, socket is used for MySQL.
#	If set to empty string, socket is used for PostgreSQL.
#
# Mandatory: no
# Default:
# DBHost=localhost

### Option: DBName
#	Database name.
#
# Mandatory: yes
# Default:
# DBName=

DBName=zabbix

### Option: DBSchema
#	Schema name. Used for IBM DB2 and PostgreSQL.
#
# Mandatory: no
# Default:
# DBSchema=

### Option: DBUser
#	Database user.
#
# Mandatory: no
# Default:
# DBUser=

DBUser=zabbix

### Option: DBPassword
#	Database password.
#	Comment this line if no password is used.
#
# Mandatory: no
# Default:
# DBPassword=
DBPassword=97Gilgamesh.01

### Option: DBSocket
#	Path to MySQL socket.
#
# Mandatory: no
# Default:
# DBSocket=

### Option: DBPort
#	Database port when not using local socket.
#
# Mandatory: no
# Range: 1024-65535
# Default:
# DBPort=

### Option: HistoryStorageURL
#	History storage HTTP[S] URL.
#
# Mandatory: no
# Default:
# HistoryStorageURL=

### Option: HistoryStorageTypes
#	Comma separated list of value types to be sent to the history storage.
#
# Mandatory: no
# Default:
# HistoryStorageTypes=uint,dbl,str,log,text

### Option: HistoryStorageDateIndex
#	Enable preprocessing of history values in history storage to store values in different indices based on date.
#	0 - disable
#	1 - enable
#
# Mandatory: no
# Default:
# HistoryStorageDateIndex=0

### Option: ExportDir
#	Directory for real time export of events, history and trends in newline delimited JSON format.
#	If set, enables real time export.
#
# Mandatory: no
# Default:
# ExportDir=

### Option: ExportFileSize
#	Maximum size per export file in bytes.
#	Only used for rotation if ExportDir is set.
#
# Mandatory: no
# Range: 1M-1G
# Default:
# ExportFileSize=1G

############ ADVANCED PARAMETERS ################

### Option: StartPollers
#	Number of pre-forked instances of pollers.
#
# Mandatory: no
# Range: 0-1000
# Default:
# StartPollers=5

### Option: StartIPMIPollers
#	Number of pre-forked instances of IPMI pollers.
#		The IPMI manager process is automatically started when at least one IPMI poller is started.
#
# Mandatory: no
# Range: 0-1000
# Default:
# StartIPMIPollers=0

### Option: StartPreprocessors
#	Number of pre-forked instances of preprocessing workers.
#		The preprocessing manager process is automatically started when preprocessor worker is started.
#
# Mandatory: no
# Range: 1-1000
# Default:
# StartPreprocessors=3

### Option: StartPollersUnreachable
#	Number of pre-forked instances of pollers for unreachable hosts (including IPMI and Java).
#	At least one poller for unreachable hosts must be running if regular, IPMI or Java pollers
#	are started.
#
# Mandatory: no
# Range: 0-1000
# Default:
# StartPollersUnreachable=1

### Option: StartTrappers
#	Number of pre-forked instances of trappers.
#	Trappers accept incoming connections from Zabbix sender, active agents and active proxies.
#	At least one trapper process must be running to display server availability and view queue
#	in the frontend.
#
# Mandatory: no
# Range: 0-1000
# Default:
# StartTrappers=5

### Option: StartPingers
#	Number of pre-forked instances of ICMP pingers.
#
# Mandatory: no
# Range: 0-1000
# Default:
# StartPingers=1

### Option: StartDiscoverers
#	Number of pre-forked instances of discoverers.
#
# Mandatory: no
# Range: 0-250
# Default:
# StartDiscoverers=1

### Option: StartHTTPPollers
#	Number of pre-forked instances of HTTP pollers.
#
# Mandatory: no
# Range: 0-1000
# Default:
# StartHTTPPollers=1

### Option: StartTimers
#	Number of pre-forked instances of timers.
#	Timers process maintenance periods.
#	Only the first timer process handles host maintenance updates. Problem suppression updates are shared
#	between all timers.
#
# Mandatory: no
# Range: 1-1000
# Default:
# StartTimers=1

### Option: StartEscalators
#	Number of pre-forked instances of escalators.
#
# Mandatory: no
# Range: 0-100
# Default:
# StartEscalators=1

### Option: StartAlerters
#	Number of pre-forked instances of alerters.
#	Alerters send the notifications created by action operations.
#
# Mandatory: no
# Range: 0-100
# Default:
# StartAlerters=3

### Option: JavaGateway
#	IP address (or hostname) of Zabbix Java gateway.
#	Only required if Java pollers are started.
#
# Mandatory: no
# Default:
# JavaGateway=

### Option: JavaGatewayPort
#	Port that Zabbix Java gateway listens on.
#
# Mandatory: no
# Range: 1024-32767
# Default:
# JavaGatewayPort=10052

### Option: StartJavaPollers
#	Number of pre-forked instances of Java pollers.
#
# Mandatory: no
# Range: 0-1000
# Default:
# StartJavaPollers=0

### Option: StartVMwareCollectors
#	Number of pre-forked vmware collector instances.
#
# Mandatory: no
# Range: 0-250
# Default:
# StartVMwareCollectors=0

### Option: VMwareFrequency
#	How often Zabbix will connect to VMware service to obtain a new data.
#
# Mandatory: no
# Range: 10-86400
# Default:
# VMwareFrequency=60

### Option: VMwarePerfFrequency
#	How often Zabbix will connect to VMware service to obtain performance data.
#
# Mandatory: no
# Range: 10-86400
# Default:
# VMwarePerfFrequency=60

### Option: VMwareCacheSize
#	Size of VMware cache, in bytes.
#	Shared memory size for storing VMware data.
#	Only used if VMware collectors are started.
#
# Mandatory: no
# Range: 256K-2G
# Default:
# VMwareCacheSize=8M

### Option: VMwareTimeout
#	Specifies how many seconds vmware collector waits for response from VMware service.
#
# Mandatory: no
# Range: 1-300
# Default:
# VMwareTimeout=10

### Option: SNMPTrapperFile
#	Temporary file used for passing data from SNMP trap daemon to the server.
#	Must be the same as in zabbix_trap_receiver.pl or SNMPTT configuration file.
#
# Mandatory: no
# Default:
# SNMPTrapperFile=/tmp/zabbix_traps.tmp

SNMPTrapperFile=/var/log/snmptrap/snmptrap.log

### Option: StartSNMPTrapper
#	If 1, SNMP trapper process is started.
#
# Mandatory: no
# Range: 0-1
# Default:
# StartSNMPTrapper=0

### Option: ListenIP
#	List of comma delimited IP addresses that the trapper should listen on.
#	Trapper will listen on all network interfaces if this parameter is missing.
#
# Mandatory: no
# Default:
# ListenIP=0.0.0.0

# ListenIP=127.0.0.1

### Option: HousekeepingFrequency
#	How often Zabbix will perform housekeeping procedure (in hours).
#	Housekeeping is removing outdated information from the database.
#	To prevent Housekeeper from being overloaded, no more than 4 times HousekeepingFrequency
#	hours of outdated information are deleted in one housekeeping cycle, for each item.
#	To lower load on server startup housekeeping is postponed for 30 minutes after server start.
#	With HousekeepingFrequency=0 the housekeeper can be only executed using the runtime control option.
#	In this case the period of outdated information deleted in one housekeeping cycle is 4 times the
#	period since the last housekeeping cycle, but not less than 4 hours and not greater than 4 days.
#
# Mandatory: no
# Range: 0-24
# Default:
# HousekeepingFrequency=1

### Option: MaxHousekeeperDelete
#	The table \"housekeeper\" contains \"tasks\" for housekeeping procedure in the format:
#	[housekeeperid], [tablename], [field], [value].
#	No more than 'MaxHousekeeperDelete' rows (corresponding to [tablename], [field], [value])
#	will be deleted per one task in one housekeeping cycle.
#	If set to 0 then no limit is used at all. In this case you must know what you are doing!
#
# Mandatory: no
# Range: 0-1000000
# Default:
# MaxHousekeeperDelete=5000

### Option: CacheSize
#	Size of configuration cache, in bytes.
#	Shared memory size for storing host, item and trigger data.
#
# Mandatory: no
# Range: 128K-8G
# Default:
# CacheSize=8M

### Option: CacheUpdateFrequency
#	How often Zabbix will perform update of configuration cache, in seconds.
#
# Mandatory: no
# Range: 1-3600
# Default:
# CacheUpdateFrequency=60

### Option: StartDBSyncers
#	Number of pre-forked instances of DB Syncers.
#
# Mandatory: no
# Range: 1-100
# Default:
# StartDBSyncers=4

### Option: HistoryCacheSize
#	Size of history cache, in bytes.
#	Shared memory size for storing history data.
#
# Mandatory: no
# Range: 128K-2G
# Default:
# HistoryCacheSize=16M

### Option: HistoryIndexCacheSize
#	Size of history index cache, in bytes.
#	Shared memory size for indexing history cache.
#
# Mandatory: no
# Range: 128K-2G
# Default:
# HistoryIndexCacheSize=4M

### Option: TrendCacheSize
#	Size of trend cache, in bytes.
#	Shared memory size for storing trends data.
#
# Mandatory: no
# Range: 128K-2G
# Default:
# TrendCacheSize=4M

### Option: ValueCacheSize
#	Size of history value cache, in bytes.
#	Shared memory size for caching item history data requests.
#	Setting to 0 disables value cache.
#
# Mandatory: no
# Range: 0,128K-64G
# Default:
# ValueCacheSize=8M

### Option: Timeout
#	Specifies how long we wait for agent, SNMP device or external check (in seconds).
#
# Mandatory: no
# Range: 1-30
# Default:
# Timeout=3

Timeout=4

### Option: TrapperTimeout
#	Specifies how many seconds trapper may spend processing new data.
#
# Mandatory: no
# Range: 1-300
# Default:
# TrapperTimeout=300

### Option: UnreachablePeriod
#	After how many seconds of unreachability treat a host as unavailable.
#
# Mandatory: no
# Range: 1-3600
# Default:
# UnreachablePeriod=45

### Option: UnavailableDelay
#	How often host is checked for availability during the unavailability period, in seconds.
#
# Mandatory: no
# Range: 1-3600
# Default:
# UnavailableDelay=60

### Option: UnreachableDelay
#	How often host is checked for availability during the unreachability period, in seconds.
#
# Mandatory: no
# Range: 1-3600
# Default:
# UnreachableDelay=15

### Option: AlertScriptsPath
#	Full path to location of custom alert scripts.
#	Default depends on compilation options.
#	To see the default path run command \"zabbix_server --help\".
#
# Mandatory: no
# Default:
# AlertScriptsPath=${datadir}/zabbix/alertscripts

AlertScriptsPath=/usr/lib/zabbix/alertscripts

### Option: ExternalScripts
#	Full path to location of external scripts.
#	Default depends on compilation options.
#	To see the default path run command \"zabbix_server --help\".
#
# Mandatory: no
# Default:
# ExternalScripts=${datadir}/zabbix/externalscripts

ExternalScripts=/usr/lib/zabbix/externalscripts

### Option: FpingLocation
#	Location of fping.
#	Make sure that fping binary has root ownership and SUID flag set.
#
# Mandatory: no
# Default:
# FpingLocation=/usr/sbin/fping

### Option: Fping6Location
#	Location of fping6.
#	Make sure that fping6 binary has root ownership and SUID flag set.
#	Make empty if your fping utility is capable to process IPv6 addresses.
#
# Mandatory: no
# Default:
# Fping6Location=/usr/sbin/fping6

### Option: SSHKeyLocation
#	Location of public and private keys for SSH checks and actions.
#
# Mandatory: no
# Default:
# SSHKeyLocation=

### Option: LogSlowQueries
#	How long a database query may take before being logged (in milliseconds).
#	Only works if DebugLevel set to 3, 4 or 5.
#	0 - don't log slow queries.
#
# Mandatory: no
# Range: 1-3600000
# Default:
# LogSlowQueries=0

LogSlowQueries=3000

### Option: TmpDir
#	Temporary directory.
#
# Mandatory: no
# Default:
# TmpDir=/tmp

### Option: StartProxyPollers
#	Number of pre-forked instances of pollers for passive proxies.
#
# Mandatory: no
# Range: 0-250
# Default:
# StartProxyPollers=1

### Option: ProxyConfigFrequency
#	How often Zabbix Server sends configuration data to a Zabbix Proxy in seconds.
#	This parameter is used only for proxies in the passive mode.
#
# Mandatory: no
# Range: 1-3600*24*7
# Default:
# ProxyConfigFrequency=3600

### Option: ProxyDataFrequency
#	How often Zabbix Server requests history data from a Zabbix Proxy in seconds.
#	This parameter is used only for proxies in the passive mode.
#
# Mandatory: no
# Range: 1-3600
# Default:
# ProxyDataFrequency=1

### Option: StartLLDProcessors
#	Number of pre-forked instances of low level discovery processors.
#
# Mandatory: no
# Range: 1-100
# Default:
# StartLLDProcessors=2

### Option: AllowRoot
#	Allow the server to run as 'root'. If disabled and the server is started by 'root', the server
#	will try to switch to the user specified by the User configuration option instead.
#	Has no effect if started under a regular user.
#	0 - do not allow
#	1 - allow
#
# Mandatory: no
# Default:
# AllowRoot=0

### Option: User
#	Drop privileges to a specific, existing user on the system.
#	Only has effect if run as 'root' and AllowRoot is disabled.
#
# Mandatory: no
# Default:
# User=zabbix

### Option: Include
#	You may include individual files or all files in a directory in the configuration file.
#	Installing Zabbix will create include directory in /usr/local/etc, unless modified during the compile time.
#
# Mandatory: no
# Default:
# Include=

# Include=/usr/local/etc/zabbix_server.general.conf
# Include=/usr/local/etc/zabbix_server.conf.d/
# Include=/usr/local/etc/zabbix_server.conf.d/*.conf

### Option: SSLCertLocation
#	Location of SSL client certificates.
#	This parameter is used only in web monitoring.
#	Default depends on compilation options.
#	To see the default path run command \"zabbix_server --help\".
#
# Mandatory: no
# Default:
# SSLCertLocation=${datadir}/zabbix/ssl/certs

### Option: SSLKeyLocation
#	Location of private keys for SSL client certificates.
#	This parameter is used only in web monitoring.
#	Default depends on compilation options.
#	To see the default path run command \"zabbix_server --help\".
#
# Mandatory: no
# Default:
# SSLKeyLocation=${datadir}/zabbix/ssl/keys

### Option: SSLCALocation
#	Override the location of certificate authority (CA) files for SSL server certificate verification.
#	If not set, system-wide directory will be used.
#	This parameter is used only in web monitoring and SMTP authentication.
#
# Mandatory: no
# Default:
# SSLCALocation=

### Option: StatsAllowedIP
#	List of comma delimited IP addresses, optionally in CIDR notation, or DNS names of external Zabbix instances.
#	Stats request will be accepted only from the addresses listed here. If this parameter is not set no stats requests
#	will be accepted.
#	If IPv6 support is enabled then '127.0.0.1', '::127.0.0.1', '::ffff:127.0.0.1' are treated equally
#	and '::/0' will allow any IPv4 or IPv6 address.
#	'0.0.0.0/0' can be used to allow any IPv4 address.
#	Example: StatsAllowedIP=127.0.0.1,192.168.1.0/24,::1,2001:db8::/32,zabbix.example.com
#
# Mandatory: no
# Default:
# StatsAllowedIP=
StatsAllowedIP=127.0.0.1

####### LOADABLE MODULES #######

### Option: LoadModulePath
#	Full path to location of server modules.
#	Default depends on compilation options.
#	To see the default path run command \"zabbix_server --help\".
#
# Mandatory: no
# Default:
# LoadModulePath=${libdir}/modules

### Option: LoadModule
#	Module to load at server startup. Modules are used to extend functionality of the server.
#	Format: LoadModule=<module.so>
#	The modules must be located in directory specified by LoadModulePath.
#	It is allowed to include multiple LoadModule parameters.
#
# Mandatory: no
# Default:
# LoadModule=

####### TLS-RELATED PARAMETERS #######

### Option: TLSCAFile
#	Full pathname of a file containing the top-level CA(s) certificates for
#	peer certificate verification.
#
# Mandatory: no
# Default:
# TLSCAFile=

### Option: TLSCRLFile
#	Full pathname of a file containing revoked certificates.
#
# Mandatory: no
# Default:
# TLSCRLFile=

### Option: TLSCertFile
#	Full pathname of a file containing the server certificate or certificate chain.
#
# Mandatory: no
# Default:
# TLSCertFile=

### Option: TLSKeyFile
#	Full pathname of a file containing the server private key.
#
# Mandatory: no
# Default:
# TLSKeyFile=
",
}
file{'/etc/httpd/conf.d/zabbix.conf':
		ensure => 'present',
		mode => '0644',
		content =>"Alias /zabbix /usr/share/zabbix

<Directory \"/usr/share/zabbix\">
    Options FollowSymLinks
    AllowOverride None
    Require all granted

    <IfModule mod_php5.c>
        php_value max_execution_time 300
        php_value memory_limit 128M
        php_value post_max_size 16M
        php_value upload_max_filesize 2M
        php_value max_input_time 300
        php_value max_input_vars 10000
        php_value always_populate_raw_post_data -1
        php_value date.timezone Europe/Riga
    </IfModule>
</Directory>

<Directory \"/usr/share/zabbix/conf\">
    Require all denied
</Directory>

<Directory \"/usr/share/zabbix/app\">
    Require all denied
</Directory>

<Directory \"/usr/share/zabbix/include\">
    Require all denied
</Directory>

<Directory \"/usr/share/zabbix/local\">
    Require all denied
</Directory>

",
}
