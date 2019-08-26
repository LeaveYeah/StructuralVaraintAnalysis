#!/bin/bash
#$ -N call_variant_PacBio
#$ -q 1-day
#$ -j y
#$ -o /data2/junwenwang/m204333/Project/sniffles/log_sniffles
#$ -M Wu.Ye@mayo.edu
#$ -m abe
#$ -l h_vmem=64G
#$ -l loc2tmp=25G
#$ -notify

. /home/m204333/.bash_profile
BASEDIR="/data2/junwenwang/m204333/Project/sniffles"
DATADIR="$BASEDIR/out"
in_bam="$DATADIR/bam/pacbio/NA12878_PacBio_MtSinai.hg38.sim2800.ngmlr.sorted.bam"
out_vcf="$DATADIR/vcf/pacbio/NA12878_PacBio_MtSinai.hg38.sim2800.ngmlr.sorted1.vcf"
ref="$DATADIR/simulated/hg38/simulated2800.fasta"

#germline variant calling on blood samples
# sniffles -m $in_bam -v $out_vcf -l 100
/data2/junwenwang/m204333/tmp/tmp.8tIx3ec0io/cmake-build-release/../bin/sniffles-core-1.0.11/sniffles -m $in_bam -v $out_vcf -l 100 -a $ref >out_sim.txt
