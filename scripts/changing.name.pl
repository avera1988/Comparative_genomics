#!/usr/bin/perl 
#
#	This is a script for modifying fasta headers of faa files obtained by gethomologues using GenBank files
##	Author Arturo Vera
#	avera@ccg.unam.mx
#############################################
use warnings;
use strict;

my(@header,$seq);

my($fastafile)=@ARGV;

open(FILE,$fastafile);
#open(OUT,">$outputfile");

while(<FILE>){
	chomp; #this removes all the new lines in a file
	if($_ =~ /^>/){
	@header=split(/\|/);
	}else{
	$seq=$_;
	print ">$header[1]\n$seq\n";
	}
}
