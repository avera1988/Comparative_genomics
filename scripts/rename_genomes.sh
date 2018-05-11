#!/bin/bash
if [ $# -eq 0 ]; then
        echo "usage: $0 list with genome_id in colum 0 and Organismis name in colum 1";
        exit 1;
        fi
file=$1
ls|grep 'GC' > genome_list.txt
START=1;
END=$(cat genome_list.txt|wc -l);
for ((c = $START ; c<= $END ; c++))
        do
        var=$(grep 'GC' $file|cut -f2|head -n ${c}|tail -n 1); dos=$(grep 'GC' $file|cut -f1|head -n ${c}|tail -n 1|tr '_' '\t'|cut
 -f 2|grep -f - genome_list.txt);
echo species ID:
echo ${dos}
echo Genome ID:
echo ${var}
mv ${dos} ${var}.${dos}
done
echo "I've finished"
