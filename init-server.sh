#!/bin/sh

# rubyをCentOSに入れるために必要な色々のインストール
sudo yum -y install git make gcc gcc-c++\
  zlib-devel openssl-devel httpd-devel\
  curl curl-devel readline-devel tk-devel\
  libxml2-devel libxslt-devel nkf\
  libyaml-devel

# rvm (bash)
bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

## append .bash_profile [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
