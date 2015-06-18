class tomcat {

	package { 'tomcat6': 
		ensure => 'installed',
	}

	group { 'tomcat':	
		ensure => 'present',
		gid => '91',
		name => 'tomcat',
	}

	user { 'tomcat':
		ensure => 'present',
		home	=> '/etc/tomcat6',
		comment => 'Puppet Managed, Tomcat User',
		groups	=> 'tomcat',
		uid	=> '91',
		shell	=> '/sbin/nologin',
		require => [ Group['tomcat'],
			     Package['tomcat6'],],
	}

	file { 'server.xml': 
		ensure => 'present',
		source => "puppet:///modules/${module_name}/server.xml",
		path => '/etc/tomcat6/server.xml',
		require => Package['tomcat6'],

	}








}
