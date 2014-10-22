#!/bin/sh
# Copy all relevant files to the current directory (i.e., the root directory of
# the candidate publication.

ETNA_COMMON=$HOME/Documents/ETNA/common
PAPER_NAME=`ls *.tex | sed s/[.]tex.*//`

rm -f eheader.tex Copyright.tex
sed -e s/BASENAME_REPLACE/$PAPER_NAME/g \
  $ETNA_COMMON/Makefile > Makefile
cp $ETNA_COMMON/Copyright.tex .
cp $ETNA_COMMON/siam/siam.bst .
cp $ETNA_COMMON/siam/siam10.clo .
cp $ETNA_COMMON/siam/siamltex.cls .
cp $ETNA_COMMON/siam/siamltex.sty .
cp $ETNA_COMMON/make_hyper.sh .
cp $ETNA_COMMON/make_eheader.sh .
