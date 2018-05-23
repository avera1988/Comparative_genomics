#!/bin/bash

if [ $# -eq 0 ]; then
        echo "usage: $0 list";
        exit 1;
        fi

file=$1
#comon=$2
dir=$(pwd);
cat $file|sort > list.sort
START=1;
END=$(cat list.sort|wc -l);
#echo $END
echo "creating directories from list"
while read -r line ;
        do
        name="$line" ;
        mkdir $name.dir ;
done < list.sort

for ((c = $START ; c<= $END ; c++));
        do
        a=$(head -n ${c} list.sort|tail -n 1);
        echo "genomes used:" $a
        mv $a*vs.*.out $a.dir
done

START=1;
END=$(cat list.sort|wc -l);
for ((c = $START ; c<= $END ; c++));
        do
        a=$(head -n ${c} list.sort|tail -n 1);
        #echo $a
        cd $a.dir;
        matrix=$(for i in *.out ;do head $i|cut -f 1 ; done)
        echo $matrix
        cd $dir
done > matrix.tab
echo "aai matrix is on:" matrix.tab
cat list.sort |awk '{split($0,a,".cat"); print a[1]}' > matrix.names
