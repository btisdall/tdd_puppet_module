# == Class tdd_puppet_module::config
#
# This class is called from tdd_puppet_module for service config.
#
class tdd_puppet_module::config {

  file { $::tdd_puppet_module::params::config_file_name:
    ensure => present,
    owner  => 'adm',
    group  => 'root',
    mode   => '0755',
  }
}
