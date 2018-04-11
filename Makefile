.PHONY: serial omp all clean

serial:
	gcc optimalfence-serial.c -lm -o serial

omp:
	gcc optimalfence-omp.c -lm -fopenmp -o omp

all: serial omp


test:
	./run-serial test_trees3
	./run-omp test_trees3 1
	./run-omp test_trees3 2
	./run-omp test_trees3 4

	./run-serial test_trees6
	./run-omp test_trees6 1
	./run-omp test_trees6 2
	./run-omp test_trees6 4

	./run-serial 15arboles
	./run-omp 15arboles 1
	./run-omp 15arboles 2
	./run-omp 15arboles 4

	./run-serial 20arboles
	./run-omp 20arboles 1
	./run-omp 20arboles 2
	./run-omp 20arboles 4

	./run-serial 25arboles
	./run-omp 25arboles 1
	./run-omp 25arboles 2
	./run-omp 25arboles 4

	./run-serial 27arboles
	./run-omp 27arboles 1
	./run-omp 27arboles 2
	./run-omp 27arboles 4


clean:
	rm serial omp testbed/*.res results/*
