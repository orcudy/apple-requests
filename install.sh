#!/bin/bash

#nghtp2
wget https://github.com/nghttp2/nghttp2/releases/download/v1.11.1/nghttp2-1.11.1.tar.gz
tar xzf nghttp2-1.11.1.tar.gz
cd nghttp2-1.11.1
apt-get install libssl-dev
export OPENSSL_CFLAGS='-I/usr/include/openssl'
export OPENSSL_LIBS='-L/usr/lib/x86_64-linux-gnu/ -lcrypto -lssl'
./configure
make
make install

#libev
wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
tar xzf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable
./configure
make
make install

#apnrequests
wget https://github.com...
cd apnrequests
make
make install

#synchronize
ldconfig
