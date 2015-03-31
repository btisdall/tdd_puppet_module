# == Class tdd_puppet_module::install
#
# This class is called from tdd_puppet_module for install.
#
class tdd_puppet_module::install {

  include apt
  package { $::tdd_puppet_module::package_name:
    ensure => present,
  }

}
