# = Class: selinux::disabled
#
# Sets up but does not enable the service
#
# == Sample Usage:
#
# include selinux::disabled
#
class selinux::disabled {


  if defined(Class['::selinux::permissive']) or defined(Class['::selinux::enforcing']) {
    debug('Not disabling since either permissive or enforcing has been enabled')
  }
  else {
    if $::selinux_config_mode != 'disabled' {
      class {'selinux::cfg': state => 'disabled' }
    }

    if $::selinux {
      warning("${::hostname}: selinux will be completely disabled after a reboot only.")
    }
  }

  }

