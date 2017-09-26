class assignment2 {
  
  user { 'becca':
    ensure => present,
	uid => '10012192',
	shell => '/bin/bash',
	home => '/home/becca',
    groups => ['sysadmin', 'cars'],
	password => '$1$B8nO52/W$rYEDv8OdwXsPV1HJyBaqL.'
  }
  
  user { 'fred':
    ensure => present,
	uid => '10022192',
	shell => '/bin/csh',
	home => '/home/fred',
    groups => ['trucks', 'cars'],
	password => '$1$BkNjh/g7$5mUVroTxa1CWOR3Tl2Ti4.'
  }

  user { 'wilma':
    ensure => present,
	uid => '10032192',
	home => '/home/wilma',
    groups => ['trucks', 'cars', 'ambulances'],
	password => '$1$XqCLK6uT$6lybz7Kc5bYGyjcZihYU50'
	
  }
  
  group { 'sysadmin':
    ensure => present,
  }
  
  group { 'cars':
    ensure => present,
  }
  
  group { 'trucks':
    ensure => present,
  }
  
  group { 'ambulances':
    ensure => present,
  }

  package { 'vim':
    ensure => present,
  }
  
  package { 'openssh':
    ensure => present,
  }
  
  package { 'httpd':
    ensure => present,
  }
  
  package { 'mysql':
    ensure => present,
  }
  
  package { 'gcc':
    ensure => present,
  }
  
  package { 'gdb':
    ensure => present,
  }
  
  package { 'emacs':
    ensure => present,
  }
  
  package { 'tmux':
    ensure => present,
  }
  
  
  
  
} 
