#!/usr/bin/perl 
###############################
#	this script modify headers from faa file obtained by c_header.gethomologes.pl. It does not work with faa files from genbank
#Author Arturo Vera
#	avera@ccg.unam.mx
##############################

while(<>){
	chomp;
	if($_=~/^>/){
		$header=$_;
		$header=~ s/>//g; 
		if($header=~/^ID/){
			@head=split(/\|/); 
			$id=$head[1];
			$id=~ s/\[//g;
			$id=~ s/\]//g;
		}elsif($header !~/^ID/){ 
			@header=split(/\t/); 
			$id=$header[1];
			$id=~ s/\[//g;
			$id=~ s/\]//g;
		}
		print ">$id\n";
	}else{
	print "$_\n";
	}
}
