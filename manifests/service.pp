# == Class ghost::service
#
# This class is meant to be called from ghost.
# It ensure the service is running.
#
class ghost::service {

  service { $::ghost::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
