# Install pip3 if not already installed
package { 'python3-pip':
  ensure => 'installed',
}

# Execute pip3 to install Flask with the specified version
exec { 'install_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  path    => '/usr/bin',
  unless  => '/usr/bin/pip3 show Flask | grep Version | grep -q 2.1.0',
  require => Package['python3-pip'],
}
