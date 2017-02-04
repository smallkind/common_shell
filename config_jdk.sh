#!/bin/bash
#config bash jdk
#xiang 2016-11-17
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

if [ ! -d /usr/java ];then
   mkdir /usr/java
fi
if [ ! -f /usr/java/jdk-8u51-linux-x64.tar.gz ];then
   wget -P /usr/java --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie;" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz
   cd /usr/java
   tar -xvf jdk-8u51-linux-x64.tar.gz
fi
echo "JAVA_HOME=/usr/java/jdk1.8.0_51/" >>/etc/profile
echo "export JAVA_HOME" >>/etc/profile
echo -e "export PATH=\${PATH}:\${JAVA_HOME}/bin">>/etc/profile
echo -e "export CLASSPATH=.:\${JAVA_HOME}/lib/dt.jar:\${JAVA_HOME}/lib/tools.jar">>/etc/profile
source /etc/profile
echo "Install success!"
java -version

