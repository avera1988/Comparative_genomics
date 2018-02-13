#!/bin/perl -w 
@ARGV == 2 or die "Uso: perl $0 Archivo.fasta Nombre_del_header\n";
($file,$valor)=@ARGV;
open (FILE, $file);
while(<FILE>){ 
	chomp; 
	if($_ =~ /^>/){ 
	$header=$_;
}
	else{
	$seq=$_; 
	print "$header\t[$valor]\n$seq\n";
	}
}

