# = Class: selinux::disabled
#
# Sets up but does not enable the service
#
# == Sample Usage:
#
# include selinux::disabled
#
class selinux::disabled {

  if $::selinux_config_mode != 'disabled' {
    class {'selinux::cfg': state => 'disabled' }
  }

  if $::selinux {
    warning("${::hostname}: selinux will be completely disabled after a reboot only.")
  }

}

