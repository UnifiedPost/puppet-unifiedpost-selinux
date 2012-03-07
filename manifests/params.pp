# = Class: selinux::params
#
# Tweak configuration for selinux.
#
# == Parameters:
#
# $config::   Path to the selinux configuration file
#
# == Actions:
#
# == Requires:
#
# == Sample Usage:
#
class selinux::params (
  $config = undef
){

  $cfg = $config ? {
    undef   => $::operatingsystem ? {
      default              => '/etc/selinux/config',
    },
    default => $config,
  }

}

