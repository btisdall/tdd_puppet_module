# == Class tdd_puppet_module::params
#
# This class is meant to be called from tdd_puppet_module.
# It sets variables according to platform.
#
class tdd_puppet_module::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'nginx'
      $service_name = 'nginx'
      $config_file_name = '/etc/tdd_puppet_module.cfg'
    }
    'RedHat': {
      $package_name = 'nginx'
      $service_name = 'nginx'
      $config_file_name = "/etc/tdd_puppet_module.conf"
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
