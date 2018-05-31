.PHONY: serial omp mpi hybrid all clean

serial:
	gcc optimalfence-serial.c -lm -o serial

omp:
	gcc optimalfence-omp.c -lm -fopenmp -o omp
	
mpi:
	mpicc optimalfence-mpi.c -lm -o mpi

hybrid:
	mpicc optimalfence-hybrid.c -lm  -fopenmp -o hybrid


all: serial omp mpi hybrid


test_serial:
	./run-serial test_trees3
	./run-serial test_trees6
	./run-serial 15arboles
	./run-serial 20arboles
	./run-serial 25arboles
	./run-serial 27arboles

test_omp:
	./run-omp test_trees3 1
	./run-omp test_trees3 2
	./run-omp test_trees3 4

	./run-omp test_trees6 1
	./run-omp test_trees6 2
	./run-omp test_trees6 4

	./run-omp 15arboles 1
	./run-omp 15arboles 2
	./run-omp 15arboles 4

	./run-omp 20arboles 1
	./run-omp 20arboles 2
	./run-omp 20arboles 4

	./run-omp 25arboles 1
	./run-omp 25arboles 2
	./run-omp 25arboles 4

	./run-omp 27arboles 1
	./run-omp 27arboles 2
	./run-omp 27arboles 4

test_mpi:
	./run-mpi test_trees3 1
	./run-mpi test_trees3 2
	./run-mpi test_trees3 4
	./run-mpi test_trees3 8
	./run-mpi test_trees3 16
	./run-mpi test_trees3 32

	./run-mpi test_trees6 1
	./run-mpi test_trees6 2
	./run-mpi test_trees6 4
	./run-mpi test_trees6 8
	./run-mpi test_trees6 16
	./run-mpi test_trees6 32

	./run-mpi 15arboles 1
	./run-mpi 15arboles 2
	./run-mpi 15arboles 4
	./run-mpi 15arboles 8
	./run-mpi 15arboles 16
	./run-mpi 15arboles 32

	./run-mpi 20arboles 1
	./run-mpi 20arboles 2
	./run-mpi 20arboles 4
	./run-mpi 20arboles 8
	./run-mpi 20arboles 16
	./run-mpi 20arboles 32

	./run-mpi 25arboles 1
	./run-mpi 25arboles 2
	./run-mpi 25arboles 4
	./run-mpi 25arboles 8
	./run-mpi 25arboles 16
	./run-mpi 25arboles 32

	./run-mpi 27arboles 1
	./run-mpi 27arboles 2
	./run-mpi 27arboles 4
	./run-mpi 27arboles 8
	./run-mpi 27arboles 16
	./run-mpi 27arboles 32

clean:
	rm serial omp mpi hybrid mpi_script.sh testbed/*.res results/serial/* results/omp/* results/mpi/* 
