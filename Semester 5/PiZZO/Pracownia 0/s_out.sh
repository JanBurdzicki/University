#!/bin/bash

source ~/Studia/.venv/bin/activate

L=0
R=2

for i in $(seq $L $R); do
	echo "Test: ${i}"

	if [[ -f "in${i}" ]]; then
		python3 -m memory_profiler pizzo0.py < "in${i}" > "out${i}"

		NR_OF_LINES_INPUT="$(cat in${i} | wc -l)"

		# first line in input file is path to JSON file
		NR_OF_QUERIES=$((NR_OF_LINES_INPUT-1))

		cat "out${i}" | head -n $NR_OF_QUERIES > "out${i}_ans"
		cat "out${i}" | tail -n +$((NR_OF_QUERIES+1)) > "out${i}_memory"
	else
		echo "Input file in$i does not exist."
	fi
done
