# == Class tdd_puppet_module::repos
#
# This class is called from tdd_puppet_module to configure the repos necessary
# to install the module's packages
#
class tdd_puppet_module::repos {
  case $::osfamily {
    'Debian': {
      include apt
    }
    'RedHat': {
      yumrepo { "nginx":
        baseurl  => 'http://nginx.org/packages/centos/$releasever/$basearch/',
        enabled  => 1,
        gpgcheck => 0,
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
