#!/bin/bash -e
# Letztes Update: 7-Apr-2019
# pdfname - Suchen und Ersetzen


# Shell
# Repository  von Github downloaden
# $ git clone git@github.com:ju-bw/notizenDummyUbuntu-v02.git neu-notizen-projekt/
# $ vi pdfname-umbenennen.sh
# $ ./pdfname-umbenennen.sh
# $ cd neu-notizen-projekt/
# $ ./projekt.sh

# pdfname umbenennen
# https://bw1.eu       -> https://www.ju1.eu
# https://ju1.eu
# mail@bw1.eu          -> jan@ju1.eu
# info@bw1.eu

# pdfname = notizenDummyUbuntu-v02
folder="neu-notizen-projekt"
suchen="notizenDummyUbuntu-v02"
suchen_sed_reg="notizenDummyUbuntu-v02" # sed  https:\/\/bw1.eu
echo $suchen
ersetzen="notizenDummyUbuntu-v02"

# datum
TIMESTAMP=$( date +%F )
HOST=$(hostname)
echo "Suchen und Ersetzen - $HOST - $TIMESTAMP - Script"

# suche pdfname vorher
grep -r $suchen $folder/ |wc -l

# allgemein
echo "Pdfname suchen und ersetzen"
# usereingabe
#read -p "Ordner der Duchsucht werden soll: " folder
#read -p "Suchen: " suchen
#read -p "Ersetzen: " ersetzen

echo "Verarbeitung beginnt..."
find $folder/ -type f -print0 | xargs -0 sed -i -e "s/$suchen_sed_reg/$ersetzen/g"
echo "Script beendet"


# suche pdfname nachher
grep -r $suchen $folder/|wc -l
