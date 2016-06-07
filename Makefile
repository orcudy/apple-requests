CC=gcc
CFLAGS=-g
LDFLAGS=-L/usr/local/lib
LDLIBS=-lnghttp2 -levent -lssl -lcrypto -levent_openssl
SRC=apple_requests.c http_parser.c
EXE=apple_requests

all:
	gcc -fPIC -c src/apple_requests.c
	gcc -fPIC -c src/http_parser.c
	gcc -shared apple_requests.o http_parser.o -Wl,-soname,libapple_requests.so.1 -o libapple_requests.so.1.0.0 -lnghttp2 -levent -lssl -lcrypto -levent_openssl
	mkdir build || /bin/true
	mkdir lib || /bin/true
	mv *.o build
	mv *.so* lib

clean:
	rm -rf lib || /bin/true
	rm -rf build || /bin/true

install:
	cp lib/libapple_requests.so* /usr/local/lib
	cp src/apple_requests.h /usr/local/include
	cd python; python setup.py install
