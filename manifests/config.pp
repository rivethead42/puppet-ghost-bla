# == Class ghost::config
#
# This class is called from ghost for service config.
#
class ghost::config(
  $ghost_source_dir  = $ghost::ghost_source_dir,
  $ghost_content_dir = $ghost::ghost_content_dir,
  $ghost_group       = $ghost::ghost_group,
  $ghost_user        = $ghost::ghost_user,
) {
  group { $ghost_group:
    ensure => present,
  }

  user { $ghost_user:
    ensure     => present,
    managehome => true,
    home       => "/home/$ghost_user",
  }

  file { $ghost_content_dir:
    ensure  => directory,
    recurse => true,
    owner   => $ghost_user,
    group   => $ghost_group,
    require => User[$ghost_user],
  }

  file { "${ghost_source_dir}/config.js":
    ensure  => file,
    source  => "file:${ghost_source_dir}/config.example.js",
    owner   => $ghost_user,
    group   => $ghost_group,
    require => User[$ghost_user],
  }
  -> file { "${ghost_content_dir}/config.js":
    ensure => link,
    target => "${ghost_source_dir}/config.js",
  }
}
