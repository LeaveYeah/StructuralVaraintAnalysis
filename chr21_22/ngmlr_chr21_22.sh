#!/bin/bash
#$ -N alignment_PacBio
#$ -q 30-days
#$ -j y
#$ -o /data2/junwenwang/m204333/Project/sniffles/log
#$ -M Wu.Ye@mayo.edu
#$ -m abe
#$ -l h_vmem=64G
#$ -l loc2tmp=25G
#$ -notify

. /home/m204333/.bash_profile
BASEDIR="/data2/junwenwang/m204333/Project/sniffles"
DATADIR="$BASEDIR/out"
in_fq="$DATADIR/fastq/chr21_22_sim0.fq"
out_sam="$DATADIR/bam/chr21_22_sim0.ngmlr.sam"
out_bam="$DATADIR/bam/chr21_22_sim0.ngmlr.bam"
out_sort_bam="$DATADIR/bam/chr21_22_sim0.ngmlr.sorted.bam"
ref="$BASEDIR/out/simulated/chr21_22/chr21_22.fa"

#germline variant calling on blood samples
ngmlr -t 20 -r $ref -q $in_fq -o $out_sam 
samtools  view -@10-Sb  $out_sam  >  $out_bam
# if [ -f $out_bam ]; then
#     rm $out_sam
# fi
samtools sort -@10 -m 7G -O bam -o $out_sort_bam $out_bam; 
samtools index $out_sort_bam