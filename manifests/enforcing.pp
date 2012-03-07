# = Class: selinux::enforcing
#
# Enable and put selinux in enforce mode.
#
# == Parameters:
#
# $configonly:: Only change the configuration. Make no changes to selinux now.
#
# == Sample Usage:
#
# include selinux::enforcing
#
class selinux::enforcing (
  $configonly = false
) {

  if $::selinux_config_mode != 'enforcing' {
    class {'selinux::cfg': state => 'enforcing' }
  }

  if ! $configonly {
    if ! $::selinux {
      warning("${::hostname}: selinux has been disabled and can not be put into enforcing mode.")
    }
    elsif $::selinux_current_mode != 'enforcing' {
      exec {'selinux_enforcing_instant':
        command => 'setenforce 1',
        onlyif  => 'selinuxenabled',
        path    => '/usr/sbin',
      }
    }
  }
}

