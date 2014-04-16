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
# tmuxで並行作業!
tmux 
yum -y update
yum -y install cpan httpd httpd-devel httpd-server\
	mysql mysql-devel mysql-server perl-DBI perl-DBD-MySQL
rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
yum -y install fcgi fcgi-perl mod_fcgid --enablerepo=epel

cpan CGI::Fast DBI DBD::mysql

cd /home/root/dotfiles/script/for-pl-mysql
# 元ファイルのバックアップ
cp /etc/sysconfig/iptables /etc/sysconfig/iptables.origin
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.origin
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conv.origin
cp /etc/httpd/conf.d/fcgid.conf /etc/httpd/conf.d/fcgid.conf.origin
cp /etc/my.conf /etc/my.conf.origin
service restart iptables
service restart sshd
service restart httpd
service restart mysqld

# 設定ファイルの配置
cp -f ./iptables /etc/sysconfig/
cp -f ./sshd_config /etc/ssh/
cp -f ./my.conf /etc/
cp -f ./httpd.conf /etc/httpd/
cp -f ./fcgid.conf /etc/httpd/conf.d/

# apache, FCGIの動作確認でつかうファイルの配置
cp -f ./test.html /var/www/html/
cp -f ./test.pl /var/www/cgi-bin/
cp -f ./test.fpl /var/www/cgi-bin/

cd ~/
service restart iptables
service restart sshd
service restart httpd
service restart mysqld
chkconfig sshd on
chkconfig httpd on
chkconfig mysqld on

# ---- 
# ユーザ追加
adduser hiwayama
passwd hiwayama
visudo
su - hiwayama

###########################################
# ここからはリモートで作業できるはず...？

# hiwayamaの環境を整える
# tmuxでスプリットしてから！！！
git clone git://github.com/ymis1080/dotfiles /home/hiwayama/dotfiles
cd /home/root/dotfiles
make init

# FCGIまでの動作確認
# /test.html
# /cgi-bin/test.pl
# /cgi-bin/test.fpl
# の動作確認

# MySQLのユーザ作成
mysql_install_db
mysqladmin password 'rootroot'
mysql -u root -p
  GRANT ALL PRIVILEGES ON *.* TO hiwayama@localhost
  IDENTIFIED BY 'hiwayama12345' WITH GRANT OPTION;
  FLUSH PRIVILEGES;
# hiwayamaになってから
mysql -u hiwayama -p < /home/hiwayama/dotfiles/for-pl-mysql/create-testdb.sql
# SELECT * FROM messages;で確認

# githubの設定
# githubに公開鍵を登録！
# クローンしてcpanモジュールをインストール！
# .sqlファイルを実行してDB作成! 
# deploy.shを起動してブラウザからアクセス！！！！！



# --- iptablesの起動
# /etc/sysconfig/iptablesの編集
# 22, 80が開いているか確認して開ける
# --- ユーザ追加とsudo設定
# adduser hiwayama
# passwd hiwayama
# visudo
# --- dotfilesの設置(hiwayama用)
# git clone git://github.com/ymis1080/dotfiles /home/hiwayama/dotfiles
# cd /home/root/dotfiles
# make init
# ---sshの設定(おまけ)
# sshd_configの設定(Port, AllowUsers)
# service sshd restart
# --- Apacheの設定
# httpd.confのURIを変更
# --- テストページの確認
# ブラウザからtest.htmlにアクセス
# ---- CGIの設定
# /etc/httpd/conf/httpd.confを書き換える
# /cgi-binディレクトリにAddHandler cgi-bin, .plと
# と+ExecCGIを追加
# => ブラウザからcgi-bin/test.plにアクセスする
# --- FastCGIの設定
# rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
# yum -y install fcgi fcgi-perl mod_fcgid --enablerepo=epel
# cpan CGI::Fast
# ※FCGIの設定は/etc/httpd/conf.d/fcgid.confで行う
# test.fcgiファイルを作成し, ブラウザからアクセスする！（ファイルのパーミッションを忘れずに！）
# MySQLの設定
# yum install -y mysql mysql-devel mysql-server perl-DBI perl-DBD-MySQL
# MySQLの初期設定
# mysql_install_db
# mysqladmin password 'rootroot'
# /etc/my.confに
# default-character-set=utf8を[mysqld][mysql][client]に入れる
# --- ユーザの作成
# mysql -u root -p
# GRANT ALL PRIVILEGES ON *.* TO hiwayama@localhost
# IDENTIFIED BY 'hiwayama12345' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
# mysql -u hiwayama -p < /home/hiwayama/dotfiles/for-pl-mysql/
# SELECT * FROM messages;で確認

