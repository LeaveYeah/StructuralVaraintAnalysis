#!/bin/bash
# $ -N call_variant_PacBio
# $ -q 1-day
# $ -j y
# $ -o /data2/junwenwang/m204333/Project/sniffles/log_sniffles
# $ -M Wu.Ye@mayo.edu
# $ -m abe
# $ -l h_vmem=64G
# $ -l loc2tmp=25G
# $ -notify

. /home/m204333/.bash_profile
BASEDIR="/data2/junwenwang/m204333/Project/sniffles"
DATADIR="$BASEDIR/out"
in_bam="$DATADIR/bam/skbr3/SRR7346978.hg19.ngmlr.sorted.bam"
out_vcf_test="$DATADIR/vcf/skbr3/SRR7346978.hg19.test.vcf"
ref="$BASEDIR/in/fasta/human_g1k_v37.fasta"

/data2/junwenwang/m204333/tmp/tmp.8tIx3ec0io/cmake-build-release/../bin/sniffles-core-1.0.11/sniffles -m $in_bam -v $out_vcf_test -l 100 -a $ref > out_skbr3_test.txt --realign_clipped_reads
# sniffles -m $in_bam -v $out_vcf_test -l 100 > out_skbr3.txt
