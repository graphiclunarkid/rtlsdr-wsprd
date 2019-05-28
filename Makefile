CC = gcc
CFLAGS = -Wall -O3 -ffast-math -std=gnu99
LDFLAGS = -L/usr/lib -Lwsprd
LIBS = -lwsprd -lusb-1.0 -lrtlsdr -lpthread -lfftw3f -lcurl -lm

TARGET_BINARY = rtlsdr_wsprd

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

.PHONY: all
all: $(TARGET_BINARY)

$(TARGET_BINARY): $(OBJ) wsprd/libwsprd.so
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS)

%.o: %.c
	$(CC) -o $@ $< -c $(CFLAGS)

.PHONY: wsprd/libwsprd.so
wsprd/libwsprd.so:
	$(MAKE) -C wsprd

.PHONY: clean
clean:
	$(MAKE) -C wsprd clean
	rm -f $(OBJ) rtlsdr_wsprd wspr_wisdom.dat hashtable.txt
