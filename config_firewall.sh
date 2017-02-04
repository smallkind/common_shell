#!/bin/bash
#config firewall,open port 80,3306,8080
#xiang 2016-11-17
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

firewall-cmd --zone=public --permanent --add-port=8080/tcp
firewall-cmd --zone=public --permanent --add-port=80/tcp
firewall-cmd --zone=public --permanent --add-port=3306/tcp
firewall-cmd --reload
firewall-cmd --zone=public --list-ports --permanent
