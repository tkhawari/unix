class services {
#--------service openssh------------->

  service { 'sshd':
    ensure  => 'running',
    enable  => true,
    require => Package['openssh-server'],
  }

 #add a notify to the file resource
  file { '/etc/ssh/sshd_config':
    notify  => Service['sshd'],  # this sets up the relationship
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => Package['openssh-server'],
 }

#--------service Apache/httpd--------->

    service { 'httpd':
    ensure  => 'running',
    enable  => true,
    require => Package['httpd'],
  }

 #add a notify to the file resource
  file { '/etc/httpd/conf/httpd.conf':
    notify  => Service['httpd'],  # this sets up the relationship
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => Package['httpd'],
 }

#---------MySQL service------------->
    service { 'mysql':
    ensure  => 'running',
    enable  => true,
    require => Package['mysql'],
  }
   file { '/etc/my.cnf':
    notify  => Service['mysql'],  # this sets up the relationship
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => Package['mysql'],
  }

#---------VNC-SERVER------------->
    service { 'tigervnc-server':
    ensure  => 'running',
    enable  => true,
    require => Package['tigervnc-server'],
  }
   file { '/etc/sysconfig/vncservers':
    notify  => Service['tigervnc-server'],  # this sets up the relationship
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => Package['tigervnc-server'],
  }

#---------SSHFS------------->

    service { 'fuse':
    ensure  => 'running',
    enable  => true,
    require => Package['fuse-devel'],
  }
   file { '/etc/fuse.conf':
    notify  => Service['fuse'],  # this sets up the relationship
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => Package['fuse-devel'],
  }

}
