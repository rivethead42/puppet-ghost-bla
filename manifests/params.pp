# == Class ghost::params
#
# This class is meant to be called from ghost.
# It sets variables according to platform.
#
class ghost::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'ghost'
      $service_name = 'ghost'
    }
    'RedHat', 'Amazon': {
      $package_name = 'ghost'
      $service_name = 'ghost'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
