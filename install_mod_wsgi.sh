#!/bin/bash

#wget https://github.com/GrahamDumpleton/mod_wsgi/archive/4.6.4.tar.gz
tar xvf mod_wsgi-4.6.4.tar.gz
cd ./mod_wsgi-4.6.4
sudo ./configure --with-python=/usr/bin/python
make
make install
# add LoadModule wsgi_module modules/mod_wsgi.so to apache conf
# /usr/lib64/httpd/modules/mod_wsgi.so should exist/created here
make clean



echo "LoadModule wsgi_module modules/mod_wsgi.so" >> /etc/httpd/conf.modules.d/00-base.conf


#######
#
#
#in /etc/httpd/conf/httpd.conf
# under DocumentRoot "/var/www/html"
# add
#
# Flask App
# https://vishnut.me/blog/ec2-flask-apache-setup.html
#
#WSGIDaemonProcess inedit-flask threads=5
#WSGIScriptAlias / /var/www/html/inedit-flask/inedit.wsgi
#
#<Directory inedit-flask>
#	WSGIProcessGroup inedit-flask
#	WSGIApplicationGroup %{GLOBAL}
#	Order deny,allow
#	Allow from all
#</Directory>




