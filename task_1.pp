class task_1 {
  
  user { 'becca':
    ensure => present,
	uid => '10012192',
	shell => '/bin/bash',
	home => '/home/becca',
    groups => ['sysadmin', 'cars'],
	password => '$1$B8nO52/W$rYEDv8OdwXsPV1HJyBaqL'
  }
  
  user { 'fred':
    ensure => present,
	uid => '10022192',
	shell => '/bin/csh',
	home => '/home/fred',
    groups => ['trucks', 'cars'],
	password => '$1$BkNjh/g7$5mUVroTxa1CWOR3Tl2Ti4'
  }

  user { 'wilma':
    ensure => present,
	uid => '10032192',
	home => '/home/wilma',
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
}
