#!/bin/bash

if [ $# -eq 0 ]; then
        echo "usage: $0 list";
        exit 1;
        fi
file=$1
dir=$(pwd); 
START=1;
END=$(cat $file|wc -l);
#echo $END
for ((c = $START ; c<= $END ; c++));
        do
        a=$(head -n ${c} names|tail -n 1);
        echo $a
        mv $a*$comon*vs.*.out $a
done

START=1;
END=$(cat $file|wc -l);
for ((c = $START ; c<= $END ; c++)); 
	do 
	a=$(head -n ${c} $file|tail -n 1); 
	#echo $a
	cd $a; 
	matrix=$(for i in *.out ;do head $i|cut -f 1 ; done)
	echo $matrix
	cd $dir
done

