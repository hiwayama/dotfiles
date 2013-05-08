#!/bin/sh

# post symbolic link of setting files
for dotfile in ".vimrc" ".vim" ".zshrc" ".tmux.conf" ".gitconfig" ".gemrc"
do  
  ln -s $HOME/dotfile/${dotfile} $HOME/${dotfile}
done

# rubyをCentOSに入れるために必要な色々のインストール
sudo yum -y install git make gcc gcc-c++\
  zlib-devel openssl-devel httpd-devel\
  curl curl-devel readline-devel tk-devel\
  libxml2-devel libxslt-devel nkf\
  libyaml-devel

# rvm (bash)
bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

## may need to append this comand to .bash_profile
# "[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
