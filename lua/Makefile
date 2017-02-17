##### Available defines for CJSON_CFLAGS #####
##
## USE_INTERNAL_ISINF:      Workaround for Solaris platforms missing isinf().
## DISABLE_INVALID_NUMBERS: Permanently disable invalid JSON numbers:
##                          NaN, Infinity, hex.
##
## Optional built-in number conversion uses the following defines:
## USE_INTERNAL_FPCONV:     Use builtin strtod/dtoa for numeric conversions.
## IEEE_BIG_ENDIAN:         Required on big endian architectures.
## MULTIPLE_THREADS:        Must be set when Lua CJSON may be used in a
##                          multi-threaded application. Requries _pthreads_.

##### Build defaults #####
LUA_VERSION =       5.1
TARGET =            uloop.so
CFLAGS =            -O3 -Wall -fPIC
LDFLAGS =   -L../  -fPIC -shared
OBJS = uloop.o

all: $(TARGET)

$(TARGET): $(OBJS) 
	$(CC) $(LDFLAGS) -o $@ $(OBJS) -lubox


clean:
	rm -f *.o $(TARGET)
