#!/bin/sh

# --
# Patches the system version of the system hyperref.sty file to work
# with the SIAM style files.

awk '
{ print }
/\\newcommand\\theHthm/ {
  print "% ---------------------------------------------------------------"
  print "% --- Begin changes BL ------------------------------------------"
  print "% ---------------------------------------------------------------"
  print "  \\renewcommand\\theHtable      {\\theHsection.\\arabic{table}}"
  print "  \\renewcommand\\theHfigure     {\\theHsection.\\arabic{figure}}"
  print "% ---------------------------------------------------------------"
  print "% --- End changes BL --------------------------------------------"
  print "% ---------------------------------------------------------------"
}' `kpsewhich hyperref.sty` > hyperref.sty

