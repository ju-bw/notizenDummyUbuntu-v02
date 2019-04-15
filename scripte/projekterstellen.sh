#!/bin/bash -e
# Letztes Update: 6-Apr-2019
# Projekt erstellen

# ANPASSEN
pdfname="notizenDummyUbuntu-v02"

# Variable
info="Projekt erstellen"
scripte="scripte"
code="code"
img="img"
img_in="img-in"
img_out="img-out"
pdf="pdf"
md="md"
tex="tex"
tex_pandoc="tex-pandoc"
html="html"
cms_wp_lokal="cms-wp-lokal"
cms_wp_server="cms-wp-server"
archiv="archiv"
excel="excel"
content="content"
timestamp=$(date +"%Y-%h-%d_%H:%M")
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju  $timestamp_2"

# ----------------------------
echo "+++ $info"

echo "+++ Verz. erstellen, wenn nicht vorhanden"
if [ ! -d ./$html ];            then mkdir -p ./$html; fi
if [ ! -d ./$cms_wp_lokal ];    then mkdir -p ./$cms_wp_lokal; fi
if [ ! -d ./$cms_wp_server ];   then mkdir -p ./$cms_wp_server; fi
if [ ! -d ./$tex ];             then mkdir -p ./$tex; fi
if [ ! -d ./$tex_pandoc ];      then mkdir -p ./$tex_pandoc; fi
if [ ! -d ./$img_in ];          then mkdir -p ./$img_in; fi
if [ ! -d ./$img_out ];         then mkdir -p ./$img_out; fi
if [ ! -d ./$excel ];           then mkdir -p ./$excel; fi
if [ ! -d ./$archiv ];          then mkdir -p ./$archiv; fi
if [ ! -d ./$code ];            then mkdir -p ./$code; fi
# projekt
if [ ! -d ./$pdfname ];          then mkdir -p ./$pdfname; fi
if [ ! -d ./$pdfname/$md ];      then mkdir -p ./$pdfname/$md; fi
if [ ! -d ./$pdfname/$html ];    then mkdir -p ./$pdfname/$html; fi
if [ ! -d ./$pdfname/$cms_wp_lokal ]; then mkdir -p ./$pdfname/$cms_wp_lokal; fi
if [ ! -d ./$pdfname/$cms_wp_server ]; then mkdir -p ./$pdfname/$cms_wp_server; fi
if [ ! -d ./$pdfname/$tex ];     then mkdir -p ./$pdfname/$tex; fi
if [ ! -d ./$pdfname/$pdf ];     then mkdir -p ./$pdfname/$pdf; fi
if [ ! -d ./$pdfname/$excel ];   then mkdir -p ./$pdfname/$excel; fi
if [ ! -d ./$pdfname/$img ];     then mkdir -p ./$pdfname/$img; fi
if [ ! -d ./$pdfname/$code ];    then mkdir -p ./$pdfname/$code; fi
if [ ! -d ./$pdfname/$scripte ]; then mkdir -p ./$pdfname/$scripte; fi
if [ ! -d ./$pdfname/$content ]; then mkdir -p ./$pdfname/$content; fi


echo "fertig"
