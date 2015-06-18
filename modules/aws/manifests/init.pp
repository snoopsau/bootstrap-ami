# == Class: aws
#
#  Puppet helpers for AWS.
#
# === Parameters
#
#  None
#
# === Variables
#
#  None.
#
# === Examples
#
#  class { aws: }
#
# === Authors
#
# Chad Metcalf <metcalfc@gmail.com>
#
# === Copyright
#
# Copyright 2013 Chad Metcalf
#
class aws {

  require aws::sdk

}
