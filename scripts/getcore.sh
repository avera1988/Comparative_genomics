#!/bin/bash
###############################################################################################################################
#This script help to obtain each one of core genes from each genomes in a diferent file for ANI
#
#list is the first argument you give by
#usage: ./getcore.sh list
#Author Arturo Vera
################################################################################################################################
if [ $# -eq 0 ]; then
        echo "usage: $0 list";
        exit 1;
        fi

a=$(ls -l|grep .faa|awk '{print $9}'|head -1); awk '{if($0 ~ /^>/){a=$0; b=split($a, c,"["); print c[2]}}' $a|sed 's/]//g' > list

#dir=$(pwd)
list=$1
START=1

END=$(cat $list|wc -l)
for (( c=$START; c<=$END; c++ ))
        do
        a=$(head -n ${c} $list|tail -n 1);
        for i in *.faa ;
                do
                grep -A 1  "$a" $i > $i.$a ;
        done;
        cat *.$a > $a.cat;
        rm *.faa.$a
done

