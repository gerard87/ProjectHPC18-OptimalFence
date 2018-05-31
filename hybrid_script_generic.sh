#!/bin/bash

## Specifies the interpreting shell for the job.
#$ -S /bin/bash

## Specifies that all environment variables active within the qsub utility be exported to the context of the job.
#$ -V

## Execute the job from the current working directory.
#$ -wd $HOME/ProjectHPC18-OptimalFence/results/hybrid

## Parallel programming environment (mpich-smp) to instantiate and number of computing slots.
#$ -pe mpich-smp $THREADS

## The  name  of  the  job.
#$ -N OptimalFenceHybrid_$NAME_$THREADS

## The folders to save the standard and error outputs.
#$ -o $HOME/ProjectHPC18-OptimalFence/results/hybrid
#$ -e $HOME/ProjectHPC18-OptimalFence/results/hybrid

MPICH_MACHINES=$TMPDIR/mpich_machines
cat $PE_HOSTFILE | awk '{print $1":1"}' > $MPICH_MACHINES


## In this line you have to write the command that will execute your application.
mpiexec -f $MPICH_MACHINES -n $NHOSTS $HOME/ProjectHPC18-OptimalFence/hybrid $HOME/ProjectHPC18-OptimalFence/testbed/$NAME.txt


rm -rf $MPICH_MACHINES

