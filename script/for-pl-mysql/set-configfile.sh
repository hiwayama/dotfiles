#!/bin/sh

# ---------
# 設定ファイルの配置
# tmuxを起動してyum -y update中に実行したい...
# rootから!!!

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
cp -f ./conf/iptables /etc/sysconfig/
cp -f ./conf/sshd_config /etc/ssh/
cp -f ./conf/my.conf /etc/
cp -f ./conf/httpd.conf /etc/httpd/
cp -f ./conf/fcgid.conf /etc/httpd/conf.d/

# apache, FCGIの動作確認でつかうファイルの配置
cp -f ./check-pl-script/test.html /var/www/html/
cp -f ./check-pl-script/test.pl /var/www/cgi-bin/
cp -f ./check-pl-script/test.fpl /var/www/cgi-bin/

cd ~/
service restart iptables
service restart sshd
service restart httpd
service restart mysqld
chkconfig sshd on
chkconfig httpd on
chkconfig mysqld on

