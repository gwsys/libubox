FLAGS        = -std=gnu99 -Iinclude
CFLAGS       = -fPIC -Wall 
LDFLAGS	     = -shared
#DEBUGFLAGS   = -O0 -D _DEBUG
#RELEASEFLAGS = -O2 -D NDEBUG -combine -fwhole-program
LIBS = -ljson-c
TARGET  = libubox.so
SOURCES = $(shell echo *.c)
HEADERS = $(shell echo *.h)
OBJECTS = $(SOURCES:.c=.o)
dirs = lua
LUA_VER = 5.1

PREFIX = $(DESTDIR)/usr/local
BINDIR = $(PREFIX)/bin

all: $(TARGET)  subdirs

subdirs: libubox.so
	$(foreach N,$(dirs),make -C $(N);)	

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) $(CFLAGS)  -o $(TARGET) $(OBJECTS) $(LIBS)

install-staging:
	cp libubox.so $(DESTDIR)/usr/lib
	install -d -m 0755 $(DESTDIR)/usr/include/libubox
	cp *.h $(DESTDIR)/usr/include/libubox
	
uninstall-staging:
	rm -f $(DESTDIR)/usr/lib/libubox.so
	rm -rf $(DESTDIR)/usr/include/libubox

install:
	cp libubox.so $(DESTDIR)/usr/lib
	cp lua/uloop.so $(DESTDIR)/usr/lib/lua/$(LUA_VER)

uninstall:
	rm -rf $(DESTDIR)/usr/lib/libubox.so
	rm -rf $(DESTDIR)/usr/lib/lua/$(LUA_VER)/uloop.so

clean:
	rm -f *.o $(TARGET)
	$(foreach N,$(dirs),make -C $(N) clean ;)
