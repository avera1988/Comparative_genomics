#!/bin/bash
###############################################################################################################################
#This script help to obtain each one of core genes from each genomes in a diferent file for ANI
#
#
#usage: ./getcore.mod.sh
#Author Arturo Vera
################################################################################################################################
ls -l|grep .faa|awk '{print $9}'|head -1 > list.tmp
cat list.tmp |\
while read -r line; 
	do 
	cat $line|\
	awk '{if($0 ~ /^>/){a=$0; b=split($a, c,"["); print c[2]}}'|\
	sed 's/].*//g' ; 
done|\
	while read -r line;
	do 
	a=$(echo $line|sed 's/ /_/g');
	for i in *.faa; 
		do 
			grep -A 1 "$line" $i > $i.$a;
	done; 
	cat *.$a > $a.cat ; 
	rm *.faa.$a;
done

