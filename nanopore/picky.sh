# general installation
BASEDIR="/data2/junwenwang/m204333/Project/sniffles"
DATADIR="$BASEDIR/out"

export LASTAL=/data2/junwenwang/m204333/Tools/last-983/src/lastal
export PICKY=/data2/junwenwang/m204333/Tools/Picky-0.2.a/src/picky.pl

# general configuration
export LASTALDB="$BASEDIR/in/fasta/ucsc_hg38.lastdb"
export LASTALDBFASTA="$BASEDIR/in/fasta/ucsc_hg38.fa"
export NTHREADS=50

# FASTQ file
export in_fq="$DATADIR/fastq/rel_6.fastq"
# export in_fq="$DATADIR/fastq/nano_speedtest.fastq"
export RUN=/data2/junwenwang/m204333/Project/sniffles/out/vcf/nanopore/picky/picky

# reads alignments
time (${LASTAL} -C2 -K2 -r1 -q3 -a2 -b1 -v -v -P${NTHREADS} -Q1 ${LASTALDB} ${in_fq} 2>${RUN}.lastal.log | ${PICKY} selectRep --thread ${NTHREADS} --preload 6 1>${RUN}.align 2>${RUN}.selectRep.log) > picky_time.txt

# call SVs
time (cat ${RUN}.align | ${PICKY} callSV --oprefix ${RUN} --fastq ${in_fq} --genome ${LASTALDBFASTA}  --sam) >> > picky_time.txt

# generate VCF format
${PICKY} xls2vcf --xls ${RUN}.profile.DEL.xls --xls ${RUN}.profile.INS.xls --xls ${RUN}.profile.INDEL.xls --xls ${RUN}.profile.INV.xls --xls ${RUN}.profile.TTLC.xls --xls ${RUN}.profile.TDSR.xls --xls ${RUN}.profile.TDC.xls > ${RUN}.allsv.vcf
