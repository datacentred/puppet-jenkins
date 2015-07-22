# == Class: jenkins
#
# Installs a Jenkins CI server
#
# === Parameters
#
# [*repo_manage*]
#   Whether to enable module control of the apt repository
#
# [*repo_location*]
#   Where the repository resides
#
# [repo_*release*]
#   Release of the repository to use
#
# [*repo_repos*]
#   The repositories to enable
#
# [*repo_key*]
#   The GPG key to accept
#
class jenkins (
  $manage_repo = true,
  $repo_location = 'http://pkg.jenkins-ci.org/debian',
  $repo_release = 'binary/',
  $repo_repos = '',
  $repo_key = {
    'id'     => '150FDE3F7787E7D11EF4E12A9B7D32F2D50582E6',
    'source' => 'http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key',
  },
) {

  include ::jenkins::repo
  include ::jenkins::install
  include ::jenkins::service

  Class['::jenkins::repo'] ->
  Class['::jenkins::install'] ->
  Class['::jenkins::service']

}
