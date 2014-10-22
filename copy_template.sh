ETNA_COMMON=~/Documents/ETNA/common
rm -f eheader.tex Copyright.tex
PAPER_NAME=`ls *.tex | sed s/[.]tex.*//`
sed -e s/BASENAME_REPLACE/$PAPER_NAME/g \
	$ETNA_COMMON/Makefile > Makefile
cp $ETNA_COMMON/Copyright.tex .
cp $ETNA_COMMON/siam.bst .
cp $ETNA_COMMON/siam10.clo .
cp $ETNA_COMMON/siamltex.cls .
cp $ETNA_COMMON/siamltex.sty .
cp $ETNA_COMMON/make_hyper.sh .
cp $ETNA_COMMON/make_eheader.sh .
