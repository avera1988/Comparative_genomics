#!/bin/bash

if [ $# -eq 0 ]; then
        echo "usage: $0 core_gen_extention_file cpu path_to_enveomics_scripts";
        exit 1;
        fi


echo 'starting'

term=$1
cpu=$2
aii=$3
ls -lrth|grep $term|awk '{print $9}' > list

START=1;
END=$(cat list|wc -l);
#echo $END

for ((c = $START ; c<= $END ; c++))
        do
        a=$(head -n ${c} list|tail -n 1);
        #echo $a
        for i in *$term
                do
        $aii/aai.rb -1 $a -2 $i -t $cpu -T $a.vs.$i.aii.out
        done
done
while read -r line ; do name="$line" ; mkdir $name ; done < list

