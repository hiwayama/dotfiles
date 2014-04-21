#!/bin/sh

# 
# adduser hiwayama
# passwd hiwayama
# visudo
# su - hiwayama

# ---------
# 設定ファイルの配置
# tmuxを起動してyum -y update中に実行したい...
rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/i386/epel-release-6-8.noarch.rpm
yum -y install mysql mysql-devel mysql-server\
 httpd httpd-server httpd-devel perl-DBI perl-DBD-MySQL cpan
yum -y install fcgi mod_fcgid fcgi-perl perl-HTML-Template-Pro perl-Time-HiRes perl-Digest-SHA1 --enablerepo=epel

# 元ファイルのバックアップ
cp /etc/sysconfig/iptables /etc/sysconfig/iptables.origin
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.origin
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conv.origin
cp /etc/httpd/conf.d/fcgid.conf /etc/httpd/conf.d/fcgid.conf.origin
cp /etc/my.conf /etc/my.conf.origin

# 設定ファイルの配置
cp -f $HOME/dotfiles/script/for-pl-mysql/conf/iptables /etc/sysconfig/
cp -f $HOME/dotfiles/script/for-pl-mysql/conf/sshd_config /etc/ssh/
cp -f $HOME/dotfiles/script/for-pl-mysql/conf/my.conf /etc/
cp -f $HOME/dotfiles/script/for-pl-mysql/conf/httpd.conf /etc/httpd/conf/
cp -f $HOME/dotfiles/script/for-pl-mysql/conf/fcgid.conf /etc/httpd/conf.d/

# apache, FCGIの動作確認でつかうファイルの配置
cp -f $HOME/dotfiles/script/for-pl-mysql/check-pl-script/test.html /var/www/html/
cp -f $HOME/dotfiles/script/for-pl-mysql/check-pl-script/test.pl /var/www/cgi-bin/
cp -f $HOME/dotfiles/script/for-pl-mysql/check-pl-script/test.fpl /var/www/cgi-bin/

service iptables restart
service sshd restart
service httpd restart
service mysqld restart

chkconfig sshd on
chkconfig httpd on
chkconfig mysqld on

