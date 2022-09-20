module load java/1.8.0_45-fasrc01
module load IGV/2.3.61-gcb01
prefix=$(dirname $(which igv.sh))

java -Xmx32G \
	-Dapple.laf.useScreenMenuBar=true \
	-Djava.net.preferIPv4Stack=true \
	-jar "$prefix"/igv.jar "$@" &
