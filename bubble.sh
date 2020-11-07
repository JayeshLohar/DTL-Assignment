# Bubble Sort

# Name     : Jayesh Gadilohar
# MIS      : 111910048
# Division : 2
# Batch    : S4

#!/bin/bash

echo "Enter the Number of Inputs : "
read n

echo "Enter the Numbers in Array : "
for (( i = 0; i < $n; i++ ))
do
	read nos[$i]
done

echo "Numbers in an Array before sorting are : "
for (( i = 0; i < $n; i++ ))
do
	echo ${nos[$i]}
done

for (( i = 0; i < $n ; i++ ))
do
	for (( j = $i; j < $n; j++ ))
	do
		if [ ${nos[$i]} -gt ${nos[$j]}  ]; then
			t=${nos[$i]}
			nos[$i]=${nos[$j]}
			nos[$j]=$t
		fi
	done
done

echo -e "Sorted Array is : "
for (( i=0; i < $n; i++ ))
do
	echo ${nos[$i]}
done