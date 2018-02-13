# Comparative_genomics

Here you will find some util scripts useful for comparative genomics analysis.

1. Obtaining the core and pangenome from genomes assemblies wiht pan_core_matrix.annotated.sh.
  
  -Pipeline uses external dependencies:
  
    Prokka (https://github.com/tseemann/prokka). It uses prokka for local gen prediction and annotation.
    get_homologues (https://github.com/eead-csic-compbio/get_homologues). It uses get_homologues for orthologs obtaining and comparison for getting core and pan-genome matrices.

Make sure that these programs are installed and are in your system's executable search path. To test, in a terminal type:

          prokka -h
          get_homologues.pl -h

Running:

        ./pan_core_matrix.annotated.sh
        usage: ./pan_core_matrix.annotated.sh extention_file num_cpus path_to_comparative_genomics_scripts path_to_get_homologues
   
    
This will result in a folder with all core genome genes from analyzed genomes.

2. Average Aminoacid Identity (AAI) Matrix using sigle copy orthologous genes.

  -External dependencies 
  
  enveomics/aai.rb (https://github.com/lmrodriguezr/enveomics) For AAI pairwise comparisson.
  
 -For obtaining single copy orthologous you can use the following bash script.
  
          ./single.copy.sh
          usage: ./single.copy.sh tmp number_of_genomes_used_in_get_homologues output_dir_for_single_copy_genes
  
  -AAI comparisson: aai.sh
  
      ./aai.sh
      usage: ./aai.sh core_gen_extention_file cpu path_to_enveomics_scripts
   -Matrix generation
   
        ./matrix.sh
        usage: ./matrix.sh list
   
   For a Heatmap we can use the following simple R code:
   
            library("gplots")
            table <- read.table(file="matrix_aai_core.csv", header=TRUE, sep=",")
            mat_dat <- data.matrix(table[,2:ncol(table)])
            rnames <- table[,1]
            rownames(mat_dat) <-rnames
            heatmap.2(as.matrix(mat_dat)), cellnote=round(as.matrix(mat_dat),2), main="AAI core genome.", notecol="black", density.info="none", trace="none", dendrogram="row", margins=c(25,30), lhei = c(1,5))
            dev.off()



   
