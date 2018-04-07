.PHONY: serial omp all clean

serial:
	gcc optimalfence-serial.c -lm -o serial

omp:
	gcc optimalfence-omp.c -lm -fopenmp -o omp

all: serial omp

clean:
	rm serial omp testbed/*.res
