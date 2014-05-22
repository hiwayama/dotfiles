#!/bin/sh

rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
sudo yum -y install git make gcc gcc-c++\
  zlib-devel openssl-devel httpd-devel\
  curl curl-devel readline-devel tk-devel\
  libxml2-devel libxslt-devel nkf dstat\
  libyaml-devel zsh tree vim tmux tig --enablerepo=epel

