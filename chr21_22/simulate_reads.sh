#!/bin/bash
#$ -N simulate_reads
#$ -q 7-days
#$ -j y
#$ -o /data2/junwenwang/m204333/Project/sniffles/log_sim_reads
#$ -M Wu.Ye@mayo.edu
#$ -m abe
#$ -l h_vmem=64G
#$ -l loc2tmp=25G
#$ -notify

. /home/m204333/.bash_profile
BASEDIR="/data2/junwenwang/m204333/Project/sniffles"
DATADIR="$BASEDIR/out"
ref="$DATADIR/simulated/chr21_22/simulated.fasta"
error_profile="$DATADIR/simulated/HG002_Pac_error_profile_bwa.txt"
out_prefix="$DATADIR/fastq/chr21_22_sim0.fq"

# ref1="$DATADIR/simulated/chr21_22_mixed/simulated1.fasta"
# ref2="$DATADIR/simulated/chr21_22_mixed/simulated2.fasta"
# ref3="$DATADIR/simulated/chr21_22_mixed/simulated3.fasta"

# out_prefix1="$DATADIR/fastq/chr21_22_sim1.fq"
# out_prefix2="$DATADIR/fastq/chr21_22_sim2.fq"
# out_prefix3="$DATADIR/fastq/chr21_22_sim3.fq"

# in_bam="$DATADIR/bam/NA12878_PacBio_MtSinai.hg38.bwa.bam"
# out_file="$DATADIR/simulated/error.txt"
# samtools view $in_bam | SURVIVOR scanreads 1000 $out_file

SURVIVOR simreads $ref $error_profile 40 $out_prefix

# SURVIVOR simreads $ref1 $error_profile 20 $out_prefix1
# SURVIVOR simreads $ref2 $error_profile 12 $out_prefix2
# SURVIVOR simreads $ref3 $error_profile 8 $out_prefix3