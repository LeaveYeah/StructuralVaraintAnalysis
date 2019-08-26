#!/bin/bash
# $ -N alignment_PacBio
# $ -q lg-mem
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
in_fq="$DATADIR/fastq/rel_6.fastq"
out_sam="$DATADIR/bam/rel_6.sim.ngmlr.sam"
out_bam="$DATADIR/bam/rel_6.sim.ngmlr.bam"
out_sort_bam="$DATADIR/bam/rel_6.sim.ngmlr.sorted.bam"

ref="$BASEDIR/out/simulated/hg38/simulated.fasta"

#germline variant calling on blood samples
ngmlr -t 50 -r $ref -q $in_fq -o $out_sam -x ont
samtools view -@30 -Sb  $out_sam  >  $out_bam
samtools sort -@30 -m 7G -O bam -o $out_sort_bam $out_bam; 
samtools index $out_sort_bam
echo "sort and index done"
# if [ -f $out_bam ]; then
#     rm $out_sam
# fi
