#!/bin/bash
#config base mysql
#xinag 2016-11-17
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
sleep 10s
yum install mysql-community-server
sleep 10s
systemctl start mysqld
echo "Your account is root!\n"
echo "Please input your Password:root\n"
mysql -uroot -p << EOF
drop user ''@localhost;
grant all privileges on *.* to root@'%'identified by 'root';
flush privileges;
exit;
EOF
echo "Install success!"
