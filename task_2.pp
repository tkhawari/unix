class task_2 {
  
  package { 'openssh':
    ensure => present,
  }
  
  package { 'httpd':
    ensure => present,
  }
  
  package { 'mysql':
    ensure => present,
  }

  package { 'vncserver':
    ensure => present,
  }
  
  package { 'tmux':
    ensure => present,
  }
  
  package { 'dia2code':
    ensure => present,
  }
  
  package { 'lynx':
	ensure => present,
  }
  
  package { 'gcc':
    ensure => present,
  }
  
  package { 'gdb':
    ensure => present,
  }
  
  package { 'cgdb':
    ensure => present,
  }

  package { 'vim':
    ensure => present,
  }
  
  package { 'emacs':
    ensure => present,
  }  

  package { 'sshfs':
    ensure => present,
	source => 'ftp://195.220.108.108/linux/dag/redhat/el7/en/x86_64/dag/RPMS/fuse-sshfs-2.5-1.el7.rf.x86_64.rpm',
	name => 'fuse-sshfs',
  }
  
}