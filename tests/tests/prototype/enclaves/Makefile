APP = prototype-e1 prototype-e2 prototype-e3 prototype-e4 prototype-e5 prototype-e6 prototype-e6 prototype-e7 prototype-e8 prototype-e9 prototype-e10
APP_C_SRCS=

APP_O_OBJS = $(patsubst %,%.o, $(APP))
APP_C_OBJS = $(patsubst %.c,%.o, $(APP_C_SRCS))
APP_A_OBJS = $(patsubst %.s,%.o, $(APP_A_SRCS))
APP_OBJS = $(APP_O_OBJS) $(APP_C_OBJS)
APP_LDS ?= ../../app.lds

APP_BIN = $(patsubst %,%.eapp_riscv,$(APP))

all: $(APP_BIN)

$(APP_OBJS): %.o: %.c
	$(CC) $(CFLAGS_EAPP) -c $<

$(APP_BIN): %.eapp_riscv : %.o $(APP_C_OBJS) $(LIB_EAPP)
	$(CC) $(LDFLAGS_EAPP) -o $@ $^ $(LIBSODIUM_DIR)/.libs/libsodium.a
   
clean:
	rm -f *.o $(APP_BIN) $(EXTRA_CLEAN)

