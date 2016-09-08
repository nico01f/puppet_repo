node default {}

node 'node1' {
  package { 'nginx':
    ensure => installed,
  }
  class {'apache':
    default_vhost => false,
    default_mods  => false,
    mpm_module    => 'prefork',
  }include apache::mod:php
apache::vhost { 'example.com':
  port    => '80'
  docroot => '/var/html/www'
}

}
