#!/bin/sh

# ---- ネットワーク設定
# dotfilesの設置(root用)
# yum -y install git vim
# git clone git://github.com/ymis1080/dotfiles /home/root/dotfiles
# make init
# ssh, mysql, apache, iptables設定ファイルの配置
# git checkout init-vm

# 動作確認に必要なライブラリのインストール
rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
yum -y install tmux --enablerepo=epel

