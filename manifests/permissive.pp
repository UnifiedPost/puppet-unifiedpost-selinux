# = Class: selinux::permissive
#
# Sets up but does not enable the service
#
# == Sample Usage:
#
# include selinux::permissive
#
class selinux::permissive (
  $configonly = false
) {


  if defined(Class['::selinux::enforcing']) {
    debug('Not setting to permissive since we want to enforce')
  }
  else {
    if $::selinux_config_mode != 'permissive' {
      class {'selinux::cfg': state => 'permissive', }
    }

    if ! $configonly {
      if ! $::selinux {
        warning("${::hostname}: selinux has been disabled and can not be put into permissive mode.")
      }
      elsif $::selinux_current_mode != 'permissive' {
        exec {'selinux_permissive_instant':
          command => 'setenforce 0',
          onlyif  => 'selinuxenabled',
          path    => '/usr/sbin',
        }
      }
    }
  }
}

