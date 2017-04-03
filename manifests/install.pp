# == Class ghost::install
#
# This class is called from ghost for install.
#
class ghost::install {

  package { $::ghost::package_name:
    ensure => present,
  }
}
