class task_2 {

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
  
  package { 'lynx':
	ensure => present,
  }

}