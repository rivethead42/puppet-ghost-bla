# == Class ghost::params
#
# This class is meant to be called from ghost.
# It sets variables according to platform.
#
class ghost::params {
  $ghost_version = '0.11.7'
  $ghost_source_dir = '/usr/src/ghost'
  $ghost_content_dir = '/var/lib/ghost'
  $ghost_group = 'ghost'
  $ghost_user = 'ghost'
}
