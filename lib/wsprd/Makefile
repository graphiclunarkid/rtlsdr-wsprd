CC = gcc
FC = gfortran

CFLAGS= -I/usr/include -Wall -fPIC -Wno-missing-braces -Wno-unused-result -O3 -ffast-math
LDFLAGS = -shared -L/usr/lib
FFLAGS = -fPIC -O2 -Wall -Wno-conversion
LIBS = -lfftw3f -lm -lgfortran

TARGET_LIB = libwsprd.so

# Default rules
%.o: %.c $(DEPS)
	${CC} ${CFLAGS} -c $<
%.o: %.f
	${FC} ${FFLAGS} -c $<
%.o: %.F
	${FC} ${FFLAGS} -c $<
%.o: %.f90 
	${FC} ${FFLAGS} -c $<
%.o: %.F90
	${FC} ${FFLAGS} -c $<

.PHONY: all
all:    $(TARGET_LIB)

DEPS =  wsprsim_utils.h wsprd_utils.h fano.h jelinek.h nhash.h

indexx.o: ../indexx.f90
	${FC} -o indexx.o ${FFLAGS} -c ../indexx.f90 

OBJS1 = wsprd.o wsprsim_utils.o wsprd_utils.o tab.o fano.o jelinek.o nhash.o indexx.o osdwspr.o

$(TARGET_LIB): $(OBJS1)
	$(CC) -o $@ $^ $(LDFLAGS) $(LIBS)

.PHONY: clean
clean:
	rm -f *.o libwsprd.so
