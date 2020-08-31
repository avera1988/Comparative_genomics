#!/bin/bash
######################################################################
#	This scritp looks for nt sequences from core ffa files
#	for performing ANI analysis
#Author Arturo Vera
#######################################################################

ls -l|grep .cat|awk '{print $9}'|cut -d . -f 1 > list
while read -r line; 
	do 
	name=$line; 
	cat $name*.fna.una.cat|\
	awk '{if($0 ~ /^>/) print}'|\
	sed 's/>//g'|\
	awk '{print $1}'|\
	fgrep -f - -A 1 $name*.fna.una.mod.ffn.one|\
	perl ~/scripts/removing.hyphen.pl > $name.core.forANI.ffn;
done < list
