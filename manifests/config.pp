# == Class tdd_puppet_module::config
#
# This class is called from tdd_puppet_module for service config.
#
class tdd_puppet_module::config {

  file { '/etc/example_config_file.cfg':
    ensure => present,
    owner  => 'www-data',
    group  => 'root',
    mode   => '0755',
  }
}
