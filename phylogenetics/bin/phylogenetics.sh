#!/bin/bash

#mafft for global and local pairwise alignment
mafft --maxiterate 1000 --globalpair 16S_nucleotide.fasta >16S_global.clust
mafft --maxiterate 1000 --localpair 16S_nucleotide.fasta >16S_local.clust
mafft --maxiterate 1000 --globalpair RecA_protein.fasta >RecA_global.clust
mafft --maxiterate 1000 --localpair RecA_protein.fasta >RecA_local.clust

#iqtree to build ML trees
~/iqtree-1.6.7-Linux/bin/iqtree -s 16S_global.clust -st DNA -m TEST -bb 1000 -alrt 1000
~/iqtree-1.6.7-Linux/bin/iqtree -s 16S_local.clust -st DNA -m TEST -bb 1000 -alrt 1000
~/iqtree-1.6.7-Linux/bin/iqtree -s RecA_local.clust -st AA -m TEST -bb 1000 -alrt 1000
~/iqtree-1.6.7-Linux/bin/iqtree -s RecA_global.clust -st AA -m TEST -bb 1000 -alrt 1000
