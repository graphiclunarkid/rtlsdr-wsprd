CC = gcc
CFLAGS = -Wall -fPIC -O3 -ffast-math -std=gnu99
LDFLAGS = -shared -L/usr/lib
LIBS = -lfftw3f -lm

TARGET_LIB = libwsprd.so

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

.PHONY: all
all: $(TARGET_LIB)

$(TARGET_LIB): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS)

%.o: %.c
	$(CC) -o $@ $< -c $(CFLAGS)

.PHONY: clean
clean:
	rm -f libwsprd.so $(OBJ)
