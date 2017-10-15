class task_2 {
 
 
  package { 'openssh-server':
    ensure => present,
  }

  package {'httpd':
   ensure => present,
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

  package { 'lynx':
   ensure => present,
  }

#--------vnc server installation - known as tigervnc-server---->
  package {'tigervnc-server':
   ensure => present,
  }


#----Dia2Code INSTALLATION---------->

  exec {'dia2code':
   command => '/bin/wget http://sourceforge.net/projects/dia2code/files/dia2code/0.8.3/dia2code-0.8.3-1.x86_64.rpm',
   notify => Exec['install_dia2code'],
   refreshonly => true,
  }
  exec {'install_dia2code':
   command => '/bin/yum install -y dia2code-0.8.3-1.x86_64.rpm',
   refreshonly => false,
  }
#---------CGDB installation------------>


  exec {'cgdb':
   command => '/bin/wget http://dl.fedoraproject.org/pub/epel/7/x86_64/c/cgdb-0.6.8-1.el7.x86_64.rpm',
   notify => Exec['install_cgdb'],
   refreshonly => true,
  }

    exec {'install_cgdb':
   command => '/bin/yum install -y cgdb-0.6.8-1.el7.x86_64.rpm',
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
  }

  exec {'sshfs_unpack':
   command => '/bin/tar xf /etc/puppetlabs/code/environments/production/manifests/sshfs-2.8.tar.gz',
   cwd => '/etc/puppetlabs/code/environments/production/manifests/',
   notify => Exec['install_sshfs'],
   refreshonly => true,
  }

  exec {'install_sshfs':
   command => '/etc/puppetlabs/code/environments/production/manifests/sshfs-2.8/configure',
   cwd => '/etc/puppetlabs/code/environments/production/manifests/sshfs-2.8/',
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


#-----------TASK 4----------------------->
#----Puppet module stdlib is required---->
  #file_line { 'disable root':     	
  # ensure => present,
  # replace => true,
  # path => '/etc/ssh/sshd_config',
  # line => 'PermitRootLogin no',
  # match => 'PermitRootLogin yes',
  #}


  file_line { 'change DocumentRoot':	
   ensure => present,
   replace => false, 
   path => '/etc/httpd/conf/httpd.conf',
   line  => 'DocumentRoot "/var/www/s3422192"',
   match => '^DocumentRoot "\/var\/www\/html"',
  }

  #file_line {'becca sudo':
  # ensure => present,
  # path => '/etc/sudoers',
  # line => 'becca
  # ALL=(ALL) NOPASSWD:ALL',
 # }

}
