# == Class: jenkins::install
#
# Installs the jenkins packages
#
class jenkins::install {

  package { 'jenkins':
    ensure => installed,
  }

}
