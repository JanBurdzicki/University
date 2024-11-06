#!/bin/bash

L=1
R=10000

NR_OF_QUERIES=$((R - L + 1))
NR_OF_STATES=10000000000

# OUTPUT_FILE="in_a"
OUTPUT_FILE="in_max_a"

{
	echo "$NR_OF_QUERIES $NR_OF_STATES"

	for i in $(seq "$L" "$R"); do
		# prefix=$([[ $((i % 2)) -eq 1 ]] && echo "+" || echo "-")
		prefix="+"
		echo "${prefix}$(printf 'a%.0s' $(seq 1 "$i"))"
	done

} > "$OUTPUT_FILE"
