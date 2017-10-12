class task_2 {
 
 
  package { 'openssh':
    ensure => present,
    source => 'ftp://mirror.internode.on.net/pub/OpenBSD/OpenSSH/portable/openssh-7.5p1-vs-openbsd.diff.gz',
  }
  
  package { 'mysql':
    ensure => present,
  }

  package { 'wget':
   ensure => present,
  }
  
  package { 'tmux':
    ensure => present,
  }
  
  package { 'gcc':
    ensure => present,
  }
  
  package { 'gdb':
    ensure => present,
  }
  
  package { 'vim':
    ensure => present,
  }
  
  package { 'emacs':
    ensure => present,
  }
#--------vnc server installation - known as tigervnc-server---->
  package {'tigervnc-server':
   ensure => present,
  }


#----Dia2Code INSTALLATION---------->

   package { 'dia2code':
    ensure => present,
    source => 'http://sourceforge.net/projects/dia2code/files/dia2code/0.8.3/dia2code-0.8.3-1.x86_64.rpm',
   }

  package {'cgdb':
   ensure => present,
   source => 'http://dl.fedoraproject.org/pub/epel/7/x86_64/c/cgdb-0.6.8-1.el7.x86_64.rpm',
   name => 'cgdb',
  }

#----------SSHFS INSTALLATION AND DEPENDENCIES----------->
 
  package {'fuse-devel':
   ensure => present,
  }
 
  package {'glib2-devel':
   ensure => present,
  }


  exec { 'sshfs':
   command => '/usr/bin/wget https://github.com/libfuse/sshfs/releases/download/sshfs_2.8/sshfs-2.8.tar.gz',
   notify => Exec['sshfs_unpack'], 
  }

  exec {'sshfs_unpack':
   command => '/bin/tar xf /etc/puppetlabs/code/environments/production/manifests/sshfs-2.8.tar.gz',
   cwd => '/etc/puppetlabs/code/environments/production/manifests/',
   refreshonly => true,
   notify => Exec['install_sshfs'],
  }

  exec {'install_sshfs':
   command => '/etc/puppetlabs/code/environments/production/manifests/sshfs-2.8/configure',
   cwd => '/etc/puppetlabs/code/environments/production/manifests/sshfs-2.8/',
   refreshonly => true,  
  }
 
#---------TASK 3: Changing Puppet agent run time interval--------->

ini_setting { 'agent_runinterval':
  ensure => present,
  path    => "/etc/puppetlabs/puppet/puppet.conf",
  section => "agent",
  setting => "runinterval",
  value => "1200",
}
#-------------END OF TASK 3------------------->

  service { 'httpd':
   ensure => 'running',
   enable => true,
   require => Package['httpd'],
  }

  file { '/etc/httpd/conf/httpd.conf':
   notify  => Service['httpd'],
   require => Package['httpd'],
  }

}
