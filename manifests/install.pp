# == Class ghost::install
#
# This class is called from ghost for install.
#
class ghost::install(
  $ghost_version     = $::ghost::ghost_version,
  $ghost_source_dir  = $::ghost::ghost_source_dir,
) {
  include wget

  file { $ghost_source_dir:
    ensure => directory,
    recurse => true,
  }
  -> wget::fetch { "download_ghost":
    source      => "https://github.com/TryGhost/Ghost/releases/download/${ghost_version}/Ghost-${ghost_version}.zip",
    destination => "${ghost_source_dir}/ghost.zip",
    timeout     => 0,
    verbose     => false,
  }
  -> exec { 'unzip_ghost':
    command     => 'unzip ghost.zip',
    path        => '/usr/bin',
    cwd         => $ghost_source_dir,
  }
  -> exec { 'run_npm':
    command     => 'npm install --production',
    path        => '/usr/bin',
  }
}
