#!/bin/bash

source ~/Studia/.venv/bin/activate

L=0
R=2

rm memory.log
touch memory.log

for i in $(seq $L $R); do
	echo "Test: ${i}"

	if [[ -f "in${i}" ]]; then
		python3 -m memory_profiler pizzo0.py < "in${i}" > out

		NR_OF_LINES_INPUT="$(cat in${i} | wc -l)"

		# first line in input file is path to JSON file
		NR_OF_QUERIES=$((NR_OF_LINES_INPUT-1))

		cat out | head -n $NR_OF_QUERIES > out_ans
		cat out | tail -n +$((NR_OF_QUERIES+1)) > out_memory

		MEMORY_LOG="$(echo out_memory | python3 memory_checker.py)"

		MEMORY_LOG="${i}: $MEMORY_LOG"

		echo $MEMORY_LOG | cat >> memory.log

		diff -w -i "out${i}_ans" out_ans || break
	else
		echo "Input file in$i does not exist."
	fi
done

cat memory.log
