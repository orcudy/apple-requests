CC=gcc
CFLAGS=-g
LDFLAGS=-L/usr/local/lib
LDLIBS=-lnghttp2 -levent -lssl -lcrypto -levent_openssl
SRC=apnrequests.c http_parser.c
EXE=apnrequests

all:
	$(CC) $(CFLAGS) $(SRC) $(LDFLAGS) $(LDLIBS) -o $(EXE)

lib:
	gcc -fPIC -c src/apnrequests.c 
	gcc -fPIC -c src/http_parser.c
	gcc -shared apnrequests.o http_parser.o -Wl,-soname,libapnrequests.so.1 -o libapnrequests.so.1.0.0 -lnghttp2 -levent -lssl -lcrypto -levent_openssl
	mkdir build || /bin/true
	mkdir lib || /bin/true
	mv *.o build
	mv *.so* lib

clean:
	rm -rf lib || /bin/true
	rm -rf build || /bin/true

install:
	cp lib/*.so* /usr/local/lib
