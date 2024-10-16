#!/bin/bash

#set -x

function reset {
    for n in `seq 0 1 7`; do
	echo "/sys/devices/system/node/node$n/hugepages/hugepages-1048576kB/"
	cat /sys/devices/system/node/node$n/hugepages/hugepages-1048576kB/nr_hugepages
	sudo echo "0" | sudo tee /sys/devices/system/node/node$n/hugepages/hugepages-1048576kB/nr_hugepages
	cat /sys/devices/system/node/node$n/hugepages/hugepages-1048576kB/free_hugepages	
    done
}

function run {
    for c in `seq 0 1 3`; do
	echo "export CUDA_VISIBLE_DEVICES=$c"
	export CUDA_VISIBLE_DEVICES=$c
	
	for n in `seq 0 1 7`; do	    
	    if [ "$n" -eq 0 ]; then
		sudo echo "40" | sudo tee /sys/devices/system/node/node$n/hugepages/hugepages-1048576kB/nr_hugepages		
		sleep 15
		
		echo "🔵🔵🔵 NUMA-$n 🔵🔵🔵"
	    else
		nn=$((n - 1))
		sudo echo "0" | sudo tee /sys/devices/system/node/node$nn/hugepages/hugepages-1048576kB/nr_hugepages
		sleep 15
		sudo echo "40" | sudo tee /sys/devices/system/node/node$n/hugepages/hugepages-1048576kB/nr_hugepages
		sleep 15

		
		echo "🔵🔵🔵 NUMA-$n 🔵🔵🔵"
	    fi

	    echo "     RUN 10 ITERATIONS"
	    for i in `seq 0 1 9`; do
		echo "      iteration $i"
		nsys nvprof --print-gpu-trace ./vectorAdd > vaddProf.CUDA-$c.NUMA-$n.ITER-$i.log
		sleep 15
		rm -rf report*
	    done
	done

	echo "RESET"
	reset
    done
}

$@
