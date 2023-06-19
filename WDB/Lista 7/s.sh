rm -f out

echo "$1 $2 $3" > int

for((i = 0; i < 50; ++i)); do
	echo $i

	timeout 30s ./Three\ Ballot\ Attack $i < int | tail -4 >> out

	echo "" >> out
done
