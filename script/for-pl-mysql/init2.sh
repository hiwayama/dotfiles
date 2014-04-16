#!/bin/sh

# ----
# init2.sh
# ライブラリのインストールなど
#
# 並行してadduserしたい...
# 
# adduser hiwayama
# passwd hiwayama
# visudo
# su - hiwayama

# init.shが終わったらtmuxを起動して実行

# tmuxで並行作業!
yum -y update
yum -y install cpan httpd httpd-devel httpd-server\
	mysql mysql-devel mysql-server perl-DBI perl-DBD-MySQL
rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
yum -y install fcgi fcgi-perl mod_fcgid --enablerepo=epel

cpan CGI::Fast DBI DBD::mysql

cd ~/
service restart iptables
service restart sshd
service restart httpd
service restart mysqld
chkconfig sshd on
chkconfig httpd on
chkconfig mysqld on

