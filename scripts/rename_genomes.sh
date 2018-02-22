#!/bin/bash
#
file=$1
ls|grep 'GC' > genome_list.txt
START=1;
END=$(cat lista_genomas.txt|wc -l);
for ((c = $START ; c<= $END ; c++))
        do
        var=$(grep 'GC' $file|cut -f2|head -n ${c}|tail -n 1); dos=$(grep 'GC' $file|cut -f1|head -n ${c}|tail -n 1|tr '_' '\t'|cut
 -f 2|grep -f - lista_genomas.txt);
echo species ID:
echo ${dos}
echo Genome ID:
echo ${var}
mv ${dos} ${var}.${dos}
done
echo "I've finished"
