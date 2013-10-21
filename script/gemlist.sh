#!/bin/sh

# ----------------------------
# gemで使いそうなもの一覧
# Author: Hiromasa IWAYAMA
# ----------------------------

gem install activerecord
gem install json haml sqlite3 nokogiri gnuplot
gem install rails -v 3.2.6
gem install sinatra rspec


case "${OSTYPE}" in
  # Max(Unix)
  darwin*)
    # for mac
    gem install rsruby -- --with-R-include=/Library/Frameworks/R.framework/Headers --with-R-lib=/Library/Frameworks/R.framework/Libraries
  ;;
  linux*)
esac
