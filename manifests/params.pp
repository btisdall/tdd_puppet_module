# == Class tdd_puppet_module::params
#
# This class is meant to be called from tdd_puppet_module.
# It sets variables according to platform.
#
class tdd_puppet_module::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'tdd_puppet_module'
      $service_name = 'tdd_puppet_module'
    }
    'RedHat', 'Amazon': {
      $package_name = 'tdd_puppet_module'
      $service_name = 'tdd_puppet_module'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
