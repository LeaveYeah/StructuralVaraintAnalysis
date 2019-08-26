#!/bin/bash
# $ -N alignment_PacBio
# $ -q 7-days
# $ -j y
# $ -o /data2/junwenwang/m204333/Project/sniffles/log_simulated
# $ -M Wu.Ye@mayo.edu
# $ -m abe
# $ -l h_vmem=100G
# $ -l loc2tmp=25G
# $ -notify

. /home/m204333/.bash_profile
BASEDIR="/data2/junwenwang/m204333/Project/sniffles"
DATADIR="$BASEDIR/out"
in_fq="$DATADIR/fastq/rel_6.fastq"
out_sam="$DATADIR/bam/rel_6.sim.minimap2.sam"
out_bam="$DATADIR/bam/rel_6.sim.minimap2.bam"
out_sort_bam="$DATADIR/bam/rel_6.minimap2.sim.sorted.bam"

ref="$BASEDIR/out/simulated/hg38/simulated2800.fasta"

#germline variant calling on blood samples
minimap2 -t 50 -ax map-ont $ref $in_fq > $out_sam
samtools view -@30 -Sb  $out_sam  >  $out_bam
samtools sort -@30 -m 11G -O bam -o $out_sort_bam $out_bam 
samtools index $out_sort_bam
echo "sort and index done"
# if [ -f $out_bam ]; then
#     rm $out_sam
# fi
