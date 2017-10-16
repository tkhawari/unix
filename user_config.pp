class task_1 {
  
  user { 'becca':
    ensure => present,
	uid => '10012192',
	shell => '/bin/bash',
	home => '/home/becca',
	managehome => true,
    groups => ['sysadmin', 'cars'],
	password => '$1$jIDkfAD0$MDhM1jOKoNTGtZ.wvfgHg1'
  }

  exec { 'becca_sshfs':
   command => '/usr/local/bin/sshfs -o allow_other s3422192@titan.csit.rmit.edu.au:/home/sh2/s3422192 /home/becca',
   refreshonly => true,
   }
  
  user { 'fred':
    ensure => present,
	uid => '10022192',
	shell => '/bin/csh',
	home => '/home/fred',
	managehome => true,
    groups => ['trucks', 'cars', 'wheel',], #REQ 4.d - Fred in wheel group for sudoers via group
	password => '$1$Ahm3rJpS$0KpZkIe/rALAa5KJtAP9K/'
  }

  user { 'wilma':
    ensure => present,
	uid => '10032192',
	home => '/home/wilma',
	managehome => true,
    groups => ['trucks', 'cars', 'ambulances'],
	password => '$1$XqCLK6uT$6lybz7Kc5bYGyjcZihYU50'
  }
  
  ssh_authorized_key { 'ec2-user@ip-172-31-16-175.us-west-2.compute.internal':
		ensure => present,
		user => 'wilma',
		type => 'ssh-rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDbMJvU7nQQUrhAwSyc13aGj0EVRF24twXsbR0QsUvYi76II0wtoUaUqAloA4Jn66jEWVQpO1TD5tJNk+LEmYTZIAr75sMJfp9fj1+zDIpqoK10BT1FlnqhgBCek7vBYrGazoYUNzon9hL7S7k0mm86eaSJxdA451c0+DERgjb1yQTsovgLxibPcOfC3TioBqe+PwtTx2lnVil/ScfbGPE5hSza2DPIkHRn5dKVkfe2+YPh+b4sTT+NVqAMbPe6sdRD8X4FF7TXVEzQetBO8fI2tohW8E5CJN8ddoG24CC/Vebc6NPPXVmnbjQMHwCeJTQtGG/XgnJqgtc7lrjb3PoN',
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

  file { "/etc/environment": 
  content => 'export PATH:/usr/local/bin:$PATH',}

#--------------REQ 5: host records---------------->

  host{ 'titan.csit.rmit.edu.au':       
   host_aliases => 'titan',
   ip => '131.170.5.131',
  }

  host{ 'jupiter.csit.rmit.edu.au':
   host_aliases => 'jupiter',
   ip => '131.170.5.135',
  }

  host{ 'saturn.csit.rmit.edu.au':
   host_aliases => 'saturn',
   ip => '131.170.5.132',
  }

#---------------REQ 6: Agent message------------>
 
 
 $timestamp = generate("/bin/date");
  notify { 'date':
   message => "Agent run starting at ${timestamp}",
  }

}
