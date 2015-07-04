exec { 'apt-get update':
  path => '/usr/bin',
}

package { 'vim':
  ensure => present,
}

package { 'build-essential':
  ensure => present,
}

package { 'git':
  ensure => present,
}

package { 'curl':
  ensure => present,
}


file { '/var/www/':
  ensure => 'directory',
}

exec { 
  'download nvm':
  command => 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh',
  path => '/usr/bin',
  require => PACKAGE['curl']
}

exec{
 'install nvm':
  command => 'install.sh',
  path => './',
  require => EXEC['download nvm']
}

