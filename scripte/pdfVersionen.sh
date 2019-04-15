#!/bin/bash -e
# Letztes Update: 14-Ap-2019
# PDF - Versionen erstellen

# ANPASSEN
pdfname="notizenDummyUbuntu-v02"

# Variable
info="PDF - Versionen erstellen"
pdf=pdf
archiv="archiv"
#dateiname ohne Endung
filename1=`basename "main-book" .pdf`
file="MD5-Hash.txt"
timestamp=$(date +"%Y-%h-%d_%H:%M")
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju - Letztes Update: $timestamp_2"

# ------------------------------
echo "+++ $info"

# git commit (hashwert) = id
ID=$(git rev-parse --short HEAD)

# book
printf "# -------------------------------------\n"   >  $file
printf "# PDF: 				    'book'               \n"   >> $file
printf "# Datum: 			  	'$timestamp'         \n"   >> $file
printf "# Git - Hashwert: '$ID'                \n"   >> $file
printf "# -------------------------------------\n\n" >> $file

printf "# md5sum \n"                >> $file

if [ ! -e "$filename1".pdf  ]; then echo "Fehler: '$filename1'.pdf nicht vorhanden."; exit; fi
#build - Versionen erstellen - _6dc708-2016-04-03-15-53-48
fileVers="'$filename1'_'$ID'_'$timestamp'"
cp "$filename1".pdf $fileVers.pdf
echo $fileVers.pdf    >> $file
printf "\n# md5sum - Prüfsumme\n"           >> $file
#hashwert
md5sum $fileVers.pdf  >> $file


cp -Rp main-book*pdf $pdfname/$pdf/
mv -Rp main-book*pdf $archiv/
cp -Rp $file $pdfname/
cp -Rp $file $archiv/

echo "fertig"
