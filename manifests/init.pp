# == Class: tdd_puppet_module
#
# Full description of class tdd_puppet_module here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class tdd_puppet_module (
  $package_name = $::tdd_puppet_module::params::package_name,
  $service_name = $::tdd_puppet_module::params::service_name,
) inherits ::tdd_puppet_module::params {

  # validate parameters here

  class { '::tdd_puppet_module::install': } ->
  class { '::tdd_puppet_module::config': } ~>
  class { '::tdd_puppet_module::service': } ->
  Class['::tdd_puppet_module']
}
