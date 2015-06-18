class resolv {
file { 'resolv.conf':
        ensure => 'present',
        path => '/etc/resolv.conf',
        #content => 'i put this in the file',
        source => "puppet:///modules/${module_name}/resolv.conf.org",
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
}



}
