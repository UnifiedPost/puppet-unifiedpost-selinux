# = Class: selinux::cfg
#
# Helper class to modify the config file.
#
# == Parameters:
#
# $state::  State to configure.
#
# == Actions:
#
# == Requires:
#
# == Sample Usage:
#
class selinux::cfg (
  $state
){

  require selinux::params
  $cfg = $selinux::params::cfg

  exec {'selinux_cfg_modify':
    command => "sed -i 's@^\\(SELINUX=\\).*@\\1${state}@' `readlink -f ${cfg}`",
    unless  => "grep -q 'SELINUX=${state}' ${cfg}",
    path    => '/usr/bin:/bin',
  }

}

