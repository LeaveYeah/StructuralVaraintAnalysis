#!/bin/bash
# $ -N call_variant_PacBio
# $ -q 1-day
# $ -j y
# $ -o /data2/junwenwang/m204333/Project/sniffles/log_simulated
# $ -M Wu.Ye@mayo.edu
# $ -m abe
# $ -l h_vmem=64G
# $ -l loc2tmp=25G
# $ -notify

. /home/m204333/.bash_profile
BASEDIR="/data2/junwenwang/m204333/Project/sniffles"
DATADIR="$BASEDIR/out"
out_dir="$DATADIR/vcf/nanopore/nanovar_sim/"
ref="$DATADIR/simulated/hg38/simulated2800.fasta"
fastq="$DATADIR/fastq/rel_6.fastq"

/data2/junwenwang/m204333/Project/NanoVar/nanovar -t 50 -r $ref -l $fastq -o $out_dir 
