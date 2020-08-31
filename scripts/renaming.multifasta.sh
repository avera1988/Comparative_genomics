#!/usr/bin/bash
scripts='~/bin/Comparative_genomics/scripts'
for i in *.faa ;
	do
	echo -e "I am changing the file" $i 
	$scripts/changing.name.pl $i |sed 's/\[//g'|sed 's/\]//g'|sed 's/\=//g'|sed 's/\.//g'|sed 's/ /\_/g' > $i.mod;
done
