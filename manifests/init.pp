# = Class: selinux
#
# Description of selinux
#
# == Parameters:
#
# $state::        How to configure selinux. Can be 'enforcing', 'permissive'
#                 or 'disabled'.  Defaults to 'permissive'.
#
# === To be implemented:
#
# $type::         Type of policy to use. Can be 'targeted' or 'strict'.
#                 Defaults to 'targeted'.
#
# == Actions:
#
# Describe what this class does. What gets configured and how.
#
# == Requires:
#
# Requirements. This could be packages that should be made available.
#
# == Sample Usage:
#
# Use all defaults:
#
#   include selinux
#
# Set custom parameters:
#
#   class {'selinux': state => 'enforcing', }
#
# Or use the split off classes:
#
#   include selinux::disabled
#
class selinux (
  $state = 'permissive',
) {

  case $state {
    'disabled':            { include selinux::disabled }
    'enforcing':           { include selinux::enforcing }
    'permissive', default: { include selinux::permissive }
  }

}

