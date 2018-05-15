#!/bin/bash

## Specifies the interpreting shell for the job.
#$ -S /bin/bash

## Specifies that all environment variables active within the qsub utility be exported to the context of the job.
#$ -V

## Execute the job from the current working directory.
#$ -wd $HOME/ProjectHPC18-OptimalFence/results/mpi

## Parallel programming environment (mpich) to instantiate and number of computing slots.
#$ -pe mpich $THREADS

## The  name  of  the  job.
#$ -N OptimalFenceMPI_$NAME_$THREADS

## The folders to save the standard and error outputs.
#$ -o $HOME/ProjectHPC18-OptimalFence/results/mpi
#$ -e $HOME/ProjectHPC18-OptimalFence/results/mpi

MPICH_MACHINES=$TMPDIR/mpich_machines
cat $PE_HOSTFILE | awk '{print $1":"$2}' > $MPICH_MACHINES


## In this line you have to write the command that will execute your application.
mpiexec -f $MPICH_MACHINES -n $NSLOTS $HOME/ProjectHPC18-OptimalFence/mpi $HOME/ProjectHPC18-OptimalFence/testbed/$NAME.txt


rm -rf $MPICH_MACHINES

