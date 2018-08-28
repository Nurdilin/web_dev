#!/bin/bash

#wget https://github.com/GrahamDumpleton/mod_wsgi/archive/4.6.4.tar.gz
tar xvf mod_wsgi-4.6.4.tar.gz
cd ./mod_wsgi-4.6.4
sudo ./configure --with-python=/usr/bin/python
make
make install
# add LoadModule wsgi_module modules/mod_wsgi.so to apache conf
make clean
