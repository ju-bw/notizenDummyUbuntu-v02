#!/bin/bash -e
# Letztes Update: 14-Apr-2019
# PDF erstellen - pdflatex: tex -> pdf

# ANPASSEN
pdfname="notizenDummyUbuntu-v02"

# Variable
info="PDF erstellen - pdflatex: tex -> pdf"
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
timestamp=$(date +"%Y-%h-%d")
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju - Letztes Update: $timestamp_2"

# -------------------------------
echo "+++ $info"

# pdflatex: Latex --> PDF

# -------------------------------
# artikel
array=$(ls $tex)
#echo "$array"
dummyArtikel="texDummyArtikel.tex"
#ls $content/$dummyArtikel

#Array lesen
for a in ${array[@]}; do
  # filename: file.tex
  #echo $a
  # basename: file
  #echo ${a%.*}
  basename=${a%.*}
  # schreibe jeweils in datei
  artikel="$basename-main.tex"
  echo "% $copyright" > $artikel
  cat $content/$dummyArtikel >> $artikel

  # Suchen und Ersetzen
  suchen="DUMMY" # regulaerer Ausdruck
  ersetzen="$basename"
  for i in *main.tex; do
    # suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
    # loeschen:  sed -i '/suchen/d'
    sed -i "/$suchen/ s//$ersetzen/g" "$i"
  done

  # pdflatex
  # artikel
  pdflatex $basename-main.tex
  # Literatur
  biber $basename-main
  # Index
  #texindy -g  --module ff-ranges-only main-artikel.idx
   # IndexKonfig.xdy
  #xindy -L german-din -I latex --module IndexKonfig main-artikel.idx
  pdflatex $basename-main.tex
  pdflatex $basename-main.tex
done

# -------------------------------
# book
dummyBook="texDummyBook.tex"
#ls $content/$dummyBook
# schreibe in datei
book="main-book"
echo "% $copyright" > $book.tex
cat $content/$dummyBook >> $book.tex

pdflatex $book.tex
# Literatur
biber $book
# Index
#texindy -g --module ff-ranges-only $book.idx
# IndexKonfig.xdy
#xindy -L german-din -I latex --module IndexKonfig main-book.idx
pdflatex $book.tex
pdflatex $book.tex

# -------------------------------
# print
dummyPrint="texDummyPrint.tex"
#ls $content/$dummyPrint
# schreibe in datei
print="main-print"
echo "% $copyright" > $print.tex
cat $content/$dummyPrint >> $print.tex

pdflatex $print.tex
# Literatur
biber $print
# Index
#texindy -g  --module ff-ranges-only $print.idx
# IndexKonfig.xdy
#xindy -L german-din -I latex --module IndexKonfig $print.idx
pdflatex $print.tex
pdflatex $print.tex

# -------------------------------
# latexmk
#latexmk -f -pdf main-book
#latexmk -f -pdf main-print


# -------------------------------
# Latex aufraeumen
rm -f *~ *.aux *.bbl *.blg *.fls *.log *.nav *.out *.snm *.synctex *.toc \
  *.idx *.ilg *.ind *.thm *.lof *.lol *.lot *.nlo *.run.xml *blx.bib *.bcf

# -------------------------------
# kopie
# Datei umbenennen
cp -Rp "$book".pdf          $pdfname/$pdf/$pdfname-book.pdf
cp -Rp "$print".pdf         $pdfname/$pdf/$pdfname-print.pdf
mv *main.pdf                    $pdfname/$pdf/
mv *main.tex                    $pdfname/

cp -Rp *.tex                    $pdfname/
cp -Rp projekt.sh               $pdfname/


# Wenn pdf-erstellung erfolgreich,
rsync -avpEh --delete $tex/     $pdfname/$tex
rsync -avpEh --delete $md/      $pdfname/$md
rsync -avpEh --delete $html/    $pdfname/$html
rsync -avpEh --delete $cms_wp_lokal/ $pdfname/$cms_wp_lokal
rsync -avpEh --delete $cms_wp_server/ $pdfname/$cms_wp_server
rsync -avpEh --delete $excel/   $pdfname/$excel
rsync -avpEh --delete $scripte/ $pdfname/$scripte
rsync -avpEh --delete $content/ $pdfname/$content
rsync -avpEh --delete $code/    $pdfname/$code
rsync -avpEh --delete $img/     $pdfname/$img

# Scriptaufruf
./$scripte/projektInhalt.sh
cp -Rp Projekt-Inhalt.txt       $pdfname/

# archiv Kapitel Handarbeit tex
#work=~/tex/projekt
cd $tex
tar cvfz ../$archiv/"$timestamp"-Handarbeit-$tex.tar.gz .
cd ..

echo "fertig"
