#!/bin/bash
# install nginx
NGINX_VERSION=1.17.3
NGINX_YUM=yum install -y
NGINX_URL=http://nginx.org/download
NGINX_SOFT=nginx-${NGINX_VERSION}.tar.gz
NGINX_SRC=$(echo $NGINX_SOFT|sed 's/.tar.*//g')
NGINX_DIR=/usr/local/nginx

$NGINX_YUM wget gzip gcc make
$NGINX_YUM pcre pcre-devel zlib zlib-devel
wget -c $NGINX_URL/$NGINX_SOFT
tar -xzvf $NGINX_SOFT
cd $NGINX_SRC
./configure
make
make install
$NGINX_DIR/sbin/nginx
