node default {
  class { '::ntp':
    servers => [ 'au.pool.ntp.org', ],
  }

  class { 'ssh':
    storeconfigs_enabled => false,
    server_options       => {
      'PermitRootLogin'        => 'no',
      'PasswordAuthentication' => 'no',
      'AllowTcpForwarding'     => 'no',
      'X11Forwarding'          => 'no',
      'Port'                   => [22,],
    },
  }


  user { 'grantb':
    name    => 'grantb',
   groups   => 'wheel',
   comment  => 'Puppetkzjdksjdskd  Managed User',
   shell    => '/bin/bash',
   password => '$6$sulfzRA6$KmWrCBtzFZc6a7jLWCIwQ07aEA4aQnpVBkV/4MGde2nRYi8sA9OvnRUoH2MmbGa1CRHF9j3CGmV8slk8jlEdX1',
   gid      => 'sysadmins',
   home     => '/home/grantb',
   purge_ssh_keys => true,
   managehome => true,
  require   => Group['sysadmins'],
  }

  ssh_authorized_key { 'grantb@snoopy':
    user => 'grantb',
    type => 'ssh-rsa',
    key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDxYjC6usSE9xWp8r2spgelwrI35LU30ltngOKaMIy3zKqDa5nHTjD7tImqfvabG6b6ir+Qv1++5XK+/3T9Mk4ah2fIT9rtbunLUmGjfMIXICV7WZ7uzCifZa8AR6BEcvjQce2+IUvCIBZXkX9rIMYYdSEc1fTiVP7wO5mNp4zt0+QD9ITw3uiDJaFqFz4TzGZEZw1GLpAyWm7XwvymAAs+8cpvez9s7wOw8iHPvu5U6AmeZUWFcglC+WdEUhAN6a+QzyCg4148Rb6lh+wK2nwoAfFNP7T8mMi6ZNLC2HHnemTWl2zqQZXETfmvZpFcGcVf4Cm1RwHrWL91TZ0aHMjx',
}


  user { 'zainab':
  name      => 'zainab',
   groups   => 'wheel',
   comment  => 'Puppet Managed User',
   shell    => '/bin/bash',
   password => '$6$sulfzRA6$KmWrCBtzFZc6a7jLWCIwQ07aEA4aQnpVBkV/4MGde2nRYi8sA9OvnRUoH2MmbGa1CRHF9j3CGmV8slk8jlEdX1',
   gid      => 'sysadmins',
   managehome => true,
   require  => Group['sysadmins'],
    }


  # Clean up the host
  user {'root':
    ensure   => 'present',
    password => '*',
  }

  user {'ec2-user':
    ensure => 'absent',
    managehome => true,
}

  group { 'sysadmins':
  name => 'sysadmins',
  gid  => '669',
  }

}
