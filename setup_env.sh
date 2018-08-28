#!/bin/bas
mv bashrc ~/.bashrc
mv inedit_secrets ~/.inedit_secrets
source ~/.bashrc

touch setup_env.log

#become root
sudo su -

# Will automatically update
yum -y update

####################VARIOUS##########################
yum -y install git
yum -y install gcc
yum -y install telnet


######################git installations#################
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1




####################APACHE#############################
#sudo yum -y  install -y httpd
yum -y install httpd24
yum -y install httpd24-devel.x86_64

#start apache
service httpd start
#configure the Apache web server to start at each system boot.
chkconfig httpd on

######################PYTHON#########################
yum -y install  python34
ln -sfn /usr/bin/python3 /usr/bin/python
yum -y install python34-pip
pip install --upgrade pip
ln -sfn /usr/local/bin/pip /usr/bin/pip
pip install pymysql
pip install mysql-connector
pip install virtualenv
pip install Flask

echo "pip version $(pip --version)" >> setup.log

######################MYSQL#########################
yum -y remove 'mysql*'
yum -y install mysql-server
/etc/init.d/mysqld start
#/usr/libexec/mysql55/mysql_secure_installation

echo "mySql version $(mysql --version)" >> setup.log

######################ENV SET UP#####################
ln -sfn /var/www/html /root/apache_f
ln -sfn /etc/httpd/conf.d/ /root/apache_c




