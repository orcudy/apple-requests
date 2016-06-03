CC=gcc
CFLAGS=-g
LDFLAGS=-L/usr/local/lib
LDLIBS=-lnghttp2 -levent -lssl -lcrypto -levent_openssl
SRC=libpypush.c http_parser.c
EXE=pypush

all:
	$(CC) $(CFLAGS) $(SRC) $(LDFLAGS) $(LDLIBS) -o $(EXE)

lib:
	gcc -fPIC -c src/pypush.c 
	gcc -fPIC -c src/http_parser.c
	gcc -shared pypush.o http_parser.o -Wl,-soname,libpypush.so.1 -o libpypush.so.1.0.0 -lnghttp2 -levent -lssl -lcrypto -levent_openssl
	mkdir build || /bin/true
	mkdir lib || /bin/true
	mv *.o build
	mv *.so* lib

clean:
	rm -rf lib || /bin/true
	rm -rf build || /bin/true

install:
	cp lib/*.so* /usr/local/lib
