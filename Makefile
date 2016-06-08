CC := gcc
CFLAGS := -g
LDFLAGS := -L/usr/local/lib
LDLIBS := -lnghttp2 -levent -lssl -lcrypto -levent_openssl

SRCDIR := src
PYTHONDIR := python
OBJDIR := build
LIBDIR := lib

SOURCES := $(wildcard $(SRCDIR)/*.c)
OBJECTS := $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
INCLUDES := $(wildcard $(SRCDIR)/*.h)
TARGET := apple_requests
REAL := 0.0.0
SONAME := 0

INSTALLDIR := /usr/local/lib
INCLUDEDIR := /usr/local/include

all: $(OBJECTS)
	$(CC) -shared $(OBJECTS) -Wl,-soname,lib$(TARGET).so.$(SONAME) -o lib$(TARGET).so.$(REAL) $(LDFLAGS) $(LDLIBS)
	mkdir $(LIBDIR) || /bin/true
	mv *.so* $(LIBDIR)

$(OBJECTS): $(SOURCES)
	$(CC) $(CFLAGS) -fPIC -c $(SOURCES)
	mkdir $(OBJDIR) || /bin/true
	mv *.o $(OBJDIR)
clean:
	rm -rf $(OBJDIR) || /bin/true
	rm -rf $(LIBDIR) || /bin/true

install:
	cp $(LIBDIR)/lib$(TARGET).so* $(INSTALLDIR)
	cp $(INCLUDES) $(INCLUDEDIR)
	cd $(PYTHONDIR); python setup.py install
