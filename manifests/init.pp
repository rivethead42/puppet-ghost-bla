# Class: ghost
# ===========================
#
# Full description of class ghost here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class ghost (
  $package_name = $::ghost::params::package_name,
  $service_name = $::ghost::params::service_name,
) inherits ::ghost::params {

  # validate parameters here

  class { '::ghost::install': } ->
  class { '::ghost::config': } ~>
  class { '::ghost::service': } ->
  Class['::ghost']
}
