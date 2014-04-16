#!/bin/sh

rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
sudo yum -y install git make gcc gcc-c++\
  zlib-devel openssl-devel httpd-devel\
  curl curl-devel readline-devel tk-devel\
  libxml2-devel libxslt-devel nkf\
  libyaml-devel zsh tree vim tmux --enablerepo=epel

# rvm (bash)
#bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

## may need to append this comand to .bash_profile
# "[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
