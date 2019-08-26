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
in_bam="$DATADIR/bam/nanopore/rel_6.minimap2.sorted.bam"
in_bam_MD="$DATADIR/bam/nanopore/rel_6.minimap2.sorted.addmd.bam"
out_vcf="$DATADIR/vcf/nanopore/rel_6.minimap2.sorted.vcf"
out_vcf_test="$DATADIR/vcf/nanopore/rel_6.minimap2.sorted.test.vcf"
ref="$BASEDIR/in/fasta/ucsc_hg38.fa"

# samtools calmd -@10 $in_bam $ref -b > $in_bam_MD
# samtools index -@30 $in_bam_MD
/data2/junwenwang/m204333/tmp/tmp.8tIx3ec0io/cmake-build-release/../bin/sniffles-core-1.0.11/sniffles -m $in_bam_MD -v $out_vcf_test -l 100 -a $ref --realign_clipped_reads > out.txt
# sniffles -m $in_bam_MD -v $out_vcf -l 100


