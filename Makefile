CC=gcc
CFLAGS=-g
LDFLAGS=-L/usr/local/lib
LDLIBS=-lnghttp2 -levent -lssl -lcrypto -levent_openssl
SRC=apns.c http_parser.c
EXE=apns

all:
	gcc -fPIC -c src/apns.c 
	gcc -fPIC -c src/http_parser.c
	gcc -shared apns.o http_parser.o -Wl,-soname,libapns.so.1 -o libapns.so.1.0.0 -lnghttp2 -levent -lssl -lcrypto -levent_openssl
	mkdir build || /bin/true
	mkdir lib || /bin/true
	mv *.o build
	mv *.so* lib

clean:
	rm -rf lib || /bin/true
	rm -rf build || /bin/true

install:
	cp lib/libapns.so.1.0.0 /usr/local/lib
	cp src/apns.h /usr/local/include
	cd python; python setup.py install
