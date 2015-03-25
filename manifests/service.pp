# == Class tdd_puppet_module::service
#
# This class is meant to be called from tdd_puppet_module.
# It ensure the service is running.
#
class tdd_puppet_module::service {

  service { $::tdd_puppet_module::service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    provider   => 'upstart',
  }
}
