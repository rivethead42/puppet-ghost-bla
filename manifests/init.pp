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
class ghost() (
  $ghost_version     = $::ghost::params::ghost_version,
  $ghost_source_dir  = $::ghost::params::ghost_source_dir,
  $ghost_content_dir = $::ghost::params::ghost_content_dir,
  $ghost_group       = $ghost::params::ghost_group,
  $ghost_user        = $ghost::params::ghost_user,
) inherits ::ghost::params {

  # validate parameters here

  class { '::ghost::install': } ->
  class { '::ghost::config': } ->
  Class['::ghost']
}
