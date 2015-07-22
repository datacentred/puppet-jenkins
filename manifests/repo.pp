# == Class: jenkins::repo
#
# Optionally installs the jenkins-ci apt repo
#
class jenkins::repo {

  if $jenkins::manage_repo {

    include ::apt

    apt::source { 'jenkins-ci':
      location   => $jenkins::repo_location,
      release    => $jenkins::repo_release,
      repos      => $jenkins::repo_repos,
      key        => $jenkins::repo_key,
    }

  }

}
