#!/bin/bash -e
# Letztes Update: 6-Apr-2019
# Inhalt vom Projektverzeichnis

# Variable
#work=~/tex/projekt
file=Projekt-Inhalt.txt
info="Inhalt vom Projektverzeichnis"
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju - Letztes Update: $timestamp_2"

#  --------------------------------
echo "+++ $info"
# File neu anlegen
printf "%% ---------------------------------\n"      >  $file
printf "%% $info\n"                                  >> $file
printf "%% $copyright\n"                             >> $file
printf "%% ---------------------------------\n"      >> $file
printf "%% \n"                                       >> $file

# Verzeichnissinhalt
ls -lath *  >> $file

echo "fertig"
