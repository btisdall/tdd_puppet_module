# == Class tdd_puppet_module::params
#
# This class is meant to be called from tdd_puppet_module.
# It sets variables according to platform.
#
class tdd_puppet_module::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'fortune'
      $service_name = 'ssh'
    }
    'RedHat': {
      $package_name = 'cowsay'
      $service_name = 'sshd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
