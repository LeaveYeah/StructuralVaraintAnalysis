#!/bin/bash
#$ -N alignment_PacBio
#$ -q lg-mem
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
in_fq="$DATADIR/fastq/NA12878_PacBio_MtSinai.fq"
out_sam="$DATADIR/bam/NA12878_PacBio_MtSinai.hg38.ngmlr.sam"
out_bam="$DATADIR/bam/NA12878_PacBio_MtSinai.hg38.ngmlr.bam"
out_sort_bam="$DATADIR/NA12878_PacBio_MtSinai.hg38.ngmlr.sorted.bam"
ref="$BASEDIR/in/fasta/ucsc_hg38.fa"

#germline variant calling on blood samples
ngmlr -t 50 -r $ref -q $in_fq -o $out_sam 
samtools view -@30 -Sb  $out_sam  >  $out_bam
if [ -f $out_bam ]; then
    rm $out_sam
fi
samtools sort -@8 -m 7G -O bam -o $out_sort_bam $out_bam; 
samtools index $out_sort_bam