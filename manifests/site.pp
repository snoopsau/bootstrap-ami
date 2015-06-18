node default {
class { '::ntp':
  servers => [ 'au.pool.ntp.org', ],
}

class { 'ssh':
  storeconfigs_enabled => false,
  server_options => {
	'PermitRootLogin' => 'no',
    'Match User www-data' => {
      'ChrootDirectory' => '%h',
      'ForceCommand' => 'internal-sftp',
      'PasswordAuthentication' => 'yes',
      'AllowTcpForwarding' => 'no',
      'X11Forwarding' => 'no',
    },
    'Port' => [22, 2222, 2288],
  },
  client_options => {
    'Host *.amazonaws.com' => {
      'User' => 'ec2-user',
    },
  },
}


user { 'grantb':
	name => 'grantb',
	groups	=> 'wheel',
	comment => 'Puppetkzjdksjdskd  Managed User',
	shell	=> '/bin/bash',
	password => '$6$sulfzRA6$KmWrCBtzFZc6a7jLWCIwQ07aEA4aQnpVBkV/4MGde2nRYi8sA9OvnRUoH2MmbGa1CRHF9j3CGmV8slk8jlEdX1',
	gid	=> 'sysadmins',
	home	=> '/home/grantb',
	require => Group['sysadmins'],
}

user { 'zainab':
        name => 'zainab',
        groups  => 'wheel',
        comment => 'Puppet Managed User',
        shell   => '/bin/bash',
        password => '$6$sulfzRA6$KmWrCBtzFZc6a7jLWCIwQ07aEA4aQnpVBkV/4MGde2nRYi8sA9OvnRUoH2MmbGa1CRHF9j3CGmV8slk8jlEdX1',
        gid     => 'sysadmins',
        require => Group['sysadmins'],
}

user {'root':
	ensure => 'present',
	password => '*',
}

group { 'sysadmins':
	name => 'sysadmins',
	gid  => '669',
}

include resolv
include tomcat


}
