#!/bin/sh

# Volume, lo, hi, year

cat <<EOF
\special{!userdict begin 
% DSB: start-hook to etna-start-hook
/etna-start-hook{gsave 
80 780 translate
/Times-Bold findfont 7 scalefont setfont
26 -20 moveto 
(Electronic Transactions on Numerical Analysis.)
gsave show grestore 
/Times-Bold findfont 7 scalefont setfont
26 -30  moveto
(Volume $1, pp. $2-$3, $4.) 
gsave show grestore 
/Times-Bold findfont 7 scalefont setfont
26 -40 moveto
(Copyright)
gsave show grestore 
/Symbol findfont 7 scalefont setfont
59 -40 moveto
<D3>
gsave show grestore 
/Times-Bold findfont 7 scalefont setfont
67 -40 moveto
($4, Kent State University.)
gsave show grestore 
/Times-Bold findfont 7 scalefont setfont
26 -50 moveto
(ISSN 1068-9613.)
gsave show grestore 
grestore}def 
/bop-hook{
% DSB: At start of page, check if we're on page 0; if so, run etna-start-hook
dup 0 eq {etna-start-hook} if
gsave
1 setlinecap 1 setlinejoin
%-13 13 translate
-13 33 translate
0.000000 477.000000 translate 0.900 -0.900 scale
1.000 setlinewidth
% Polyline
newpath 544 -251 moveto 544 -286 lineto 451 -286 lineto 451 -251 lineto closepath  stroke
/Times-Bold  findfont 12.000 scalefont setfont
%/Palatino-Bolditalic findfont 14.000 scalefont setfont 
497 -275 moveto 
1 -1 scale
(ETNA)dup stringwidth pop 2 div neg 0 rmoveto  gsave  0.000 rotate show grestore 1 -1 scale
/Times-Bold findfont 8.000 scalefont setfont
%/Palatino-Bolditalic findfont 14.000 scalefont setfont
499 -265 moveto 
1 -1 scale
(Kent State University )dup stringwidth pop 2 div neg 0 rmoveto  gsave  0.000 rotate show grestore 1 -1 scale
%/Times-BoldItalic findfont 20.000 scalefont setfont
/Times-Bold findfont 8.000 scalefont setfont
498 -255 moveto 
1 -1 scale
(http://etna.math.kent.edu)dup stringwidth pop 2 div neg 0 rmoveto  gsave  0.000 rotate show grestore 1 -1 scale
grestore}def end}
EOF

