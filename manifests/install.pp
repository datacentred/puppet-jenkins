# == Class: jenkins::install
#
# Installs the jenkins packages
#
class jenkins::install {

  $prerequisites = [
    'default-jre-headless',
  ]

  ensure_packages($prerequisites)

  # Race in package dependencies causes jenkins to be started before
  # java has been full installed and configured
  Package[$prerequisites] ->

  package { 'jenkins':
    ensure => installed,
  }

}
