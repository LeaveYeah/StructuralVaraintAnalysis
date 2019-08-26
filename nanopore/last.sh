BASEDIR="/data2/junwenwang/m204333/Project/sniffles"
DATADIR="$BASEDIR/out"
ref="$BASEDIR/in/fasta/ucsc_hg38.fa"
ref_sim="$DATADIR/simulated/hg38/simulated2800.fasta"
# /data2/junwenwang/m204333/Project/last-983/src/lastdb -v -P 1 "$BASEDIR/in/fasta/ucsc_hg38.lastdb" $ref
/data2/junwenwang/m204333/Project/last-983/src/lastdb -v -P 1 "$DATADIR/simulated/hg38/simulated2800.lastdb" $ref_sim