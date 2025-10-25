all: clean compile exec

compile:
	g++ -c complex.cpp
	g++ -c fft.cpp

exec: complex.o fft.o
	g++ -o fft main.cpp complex.o fft.o

clean:
	rm -f fft *.o
