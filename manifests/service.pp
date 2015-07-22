# == Class: jenkins::service
#
# Ensures the Jenkins service is running
#
class jenkins::service {

  service { 'jenkins':
    ensure => running,
  }

}
