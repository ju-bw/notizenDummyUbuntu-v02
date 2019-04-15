#!/bin/bash -e
# Letztes Update: 14-Apr-2019
#
# Erstellt Websiten & Latex PDFs mit Markdown und pandoc
# sed passt die syntax an
# Versionsverwaltung git
#
# $ lsb_release -a
# 		Projekt getestet unter Ubuntu 18.04.2 LTS
#
# -------------------------------------------
# Shell
# Repository  von Github downloaden
# $ git clone git@github.com:ju-bw/notizenDummyUbuntu-v02.git neu-notizen-projekt/
# $ vi pdfname-umbenennen.sh
# $ ./pdfname-umbenennen.sh
# $ cd neu-notizen-projekt/
# $ ./projekt.sh
# -------------------------------------------
# files: anpassen
# WICHTIG
#
# pdfname
# ACHTUNG: script ausserhalb vom projektordner ausführen
# ../pdfname-umbenennen.sh
#
# codelanguage
# scripte/sed.sh  <- HTML5, Python, Bash, C, C++, [LaTeX]TeX

# CMS server pfad
# aktuell:
# scripte/sed.sh  <- https://www.ju1.eu/#

# scripte/sed.sh  <-  bildformat
# 	pdf           -> latex
# 	svg, png, jpg -> web
# -------------------------------------------

# ANPASSEN
# Titel -> ../pdfname-umbenennen.sh
pdfname="notizenDummyUbuntu-v02"
# Backup
SSD="/media/jan/virtuell"
backup="$SSD/backup/notizen"
# Variable
info="Projekt Web & Latex Ubuntu"
scripte="scripte"
code="code"
img="img"
img_in="img-in"
img_out="img-out"
pdf="pdf"
md="md"
tex="tex"
tex_pandoc="tex-pandoc"
css="css"
html="html"
cms_wp_lokal="cms-wp-lokal"
cms_wp_server="cms-wp-server"
archiv="archiv"
excel="excel"
content="content"
timestamp=$(date +"%Y-%h-%d")
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju - Letztes Update: $timestamp_2"

# ---------------------------
janein=1
while [ "$janein" -eq 1 ]; do
	###clear
	printf "\n $info \n"
	printf "\n  0) Projekt erstellen."
	printf "\n  1) Markdown in (tex, html5) - sed (Suchen/Ersetzen)"
	printf "\n  2) Kopie tex (Pandoc) - tex (Handarbeit)"
	printf "\n  3) Kapitel erstellen, Scripte ausführen"
	printf "\n  4) TEST: PDF erstellen mit pdflatex (book.pdf)"
	printf "\n  5) TEST: PDF erstellen mit latexmk (light.pdf)"
	printf "\n  6) PDFs erstellen (book-, print-, artikel.pdf) - Archiv (tex)"
	printf "\n  7) Projekt aufräumen"
	printf "\n  8) Git-Version erstellen"
	printf "\n  9) git status und git log --graph --oneline"
	printf "\n 10) git init"
	printf "\n 11) Fotos optimieren (Web, Latex)"
	printf "\n 12) PDF-Versionen erstellen"
	printf "\n 13) Backup (archiv/*.zip & *.tar.gz) & (/media/jan/virtuell/backup)"
	printf "\n 14) Beenden?"
	a=
	while [ -z "$a" ]; do
		printf "\n\nGeben Sie eine Zahl ein: "
		read a
		# Zeichenketten eliminieren ,die Zeichen ausser 0-9  enthalten
		a=${a##*[^0-9]*}
		if [ -z "$a" ]; then
			echo "+++ Ungueltige Eingabe"
		fi
	done

	echo "--------------------------"
	printf "\n"

	# --------------------
	if [ $a -eq 0 ]; then
		# Projekt erstellen. ACHTUNG: git init bzw. rm -rf .git
		# Scriptaufruf
		./$scripte/projekterstellen.sh

	# --------------------
	elif [ $a -eq 1 ]; then
		# Markdown in (tex, html5) - sed (Suchen/Ersetzen)
		# Scriptaufruf
		./$scripte/markdownLatexHtml.sh
	  ./$scripte/sed.sh

  # --------------------
	elif [ $a -eq 2 ]; then
		# Kopie tex (Pandoc) - tex (Handarbeit)
		# -u	überspringt Dateien, die im Ziel neuer sind als in der Quelle
		rsync -avupEh $tex_pandoc/ $tex

  # --------------------
	elif [ $a -eq 3 ]; then
		# Kapitel erstellen, Scripte ausführen
		# Scriptaufruf
		./$scripte/inputImgMarkdown.sh
		./$scripte/inputKapitelLatex.sh
		./$scripte/inputPdfsLatex.sh
		./$scripte/projektFiles.sh
		./$scripte/projektInhalt.sh
		./$scripte/codeFiles.sh

  # --------------------
	elif [ $a -eq 4 ]; then
		# TEST: PDF erstellen mit pdflatex (book.pdf)
		if [ `ls -a  tex | wc -l` -gt 2 ]; then
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

			# Latex aufraeumen
			rm -f *~ *.aux *.bbl *.blg *.fls *.log *.nav *.out *.snm *.synctex *.toc \
				*.idx *.ilg *.ind *.thm *.lof *.lol *.lot *.nlo *.run.xml *blx.bib *.bcf
		else
			echo "Fehler: $tex leer; Schritt 1 bis 3 ausführen.";
		fi

  # --------------------
	elif [ $a -eq 5 ]; then
		# TEST: PDF erstellen mit latexmk (*main-light.pdf)
		if [ `ls -a  tex | wc -l` -gt 2 ]; then
			# artikel ohne Inhaltsverzeichnis
			array=$(ls $tex)
			#echo "$array"
			dummyArtikel="texDummyArtikel-light.tex"
			#ls $content/$dummyArtikel

			#Array lesen
			for a in ${array[@]}; do
			  # filename: file.tex
			  #echo $a
			  # basename: file
			  #echo ${a%.*}
			  basename=${a%.*}
			  # schreibe jeweils in datei
			  artikel="$basename-main-light.tex"
			  echo "% $copyright" > $artikel
			  cat $content/$dummyArtikel >> $artikel

			  # Suchen und Ersetzen
			  suchen="DUMMY" # regulaerer Ausdruck
			  ersetzen="$basename"
			  for i in *main-light.tex; do
			    # suchen und ersetzen: sed -i '/suchen/ s//ersetzen/g' "$i"
			    # loeschen:  sed -i '/suchen/d'
			    sed -i "/$suchen/ s//$ersetzen/g" "$i"
			  done

			  # latexmk
			  latexmk -f -pdf $basename-main-light.tex
			done

			# Latex aufraeumen
			rm -f *~ *.aux *.bbl *.blg *.fls *.log *.nav *.out *.snm *.synctex *.toc \
				*.idx *.ilg *.ind *.thm *.lof *.lol *.lot *.nlo *.run.xml *blx.bib *.bcf

			cp *main-light.pdf  $pdfname/$pdf/
			cp *main-light.tex  $pdfname/
		else
			echo "Fehler: $tex/ leer; Schritt 1 bis 3 ausführen.";
		fi

  # --------------------
	elif [ $a -eq 6 ]; then
		# PDFs erstellen (book-, print-, artikel.pdf) - Archiv (tex)
		if [ `ls -a  tex | wc -l` -gt 2 ]; then
			# Scriptaufruf
			./$scripte/pdfErstellen.sh
		else
			echo "Fehler: $tex leer; Schritt 1 bis 3 ausführen.";
		fi

  # --------------------
	elif [ $a -eq 7 ]; then
		# Projekt aufräumen
		find . -name '*.aux' 2>/dev/null -exec rm -rf {}  +
		rm -rf *~  Projekt-files.tex Quellcode-files.tex inhalt.tex
		rm -rf main*.pdf
		rm -rf main*.tex
		rm -rf *light.tex
		rm -rf *light.pdf
		rm -rf *light.fdb_latexmk
		rm -rf *.txt



		# löschen img_in u. img_out
		#if [ `ls -a  $img_in | wc -l` -gt 2 ]; then rm -rf $img_in/*; fi
		#if [ `ls -a  $img_out | wc -l` -gt 2 ]; then rm -rf $img_out/*; fi

		# löschen   tex/ tex-pandoc/  html/  html-wp/ img-in/ img-out/
		if [ -d $tex ]; then rm -rf $tex; fi
		if [ -d $tex-pandoc ]; then rm -rf $tex_pandoc; fi
		if [ -d $html ]; then rm -rf $html; fi
		if [ -d $cms_wp_lokal ]; then rm -rf $cms_wp_lokal; fi
		if [ -d $cms_wp_server ]; then rm -rf $cms_wp_server; fi
		if [ -d $img_in ]; then rm -rf $img_in; fi
		if [ -d $img_out ]; then rm -rf $img_out; fi
		if [ -d $excel ]; then rm -rf $excel; fi
		if [ -d $pdf ]; then rm -rf $pdf; fi
		if [ -d $pdfname ]; then rm -rf $pdfname; fi

		# Latex aufraeumen
		if [ -e main-*.aux ]; then
			rm -rf *~ *.aux *.bbl *.blg *.fls *.log *.nav *.out *.snm *.synctex *.toc \
			  *.idx *.ilg *.ind *.thm *.lof *.lol *.lot *.nlo *.run.xml *blx.bib *.bcf *.synctex.gz
		fi

		echo "fertig"
	# --------------------
  elif [ $a -eq 8 ]; then
		# Git-Version (tex & md, ACHTUNG: wenn Projekt neu, dann git init bzw. rm -rf .git)
		# Scriptaufruf
		./$scripte/gitversionieren.sh
		if [ -d $pdfname/ ]; then
			cp -Rp .gitignore $pdfname/;
		fi

		# --------------------
	elif [ $a -eq 9 ]; then
		# git status und git log --graph --oneline
		git status
		echo "# ----------------------------------------------"
		git log --graph --oneline
		echo "# ----------------------------------------------"

# --------------------
elif [ $a -eq 10 ]; then
		# git init
		rm -rf .git
		git init
		git add .
		git commit -am "Projekt init"
		git status
		echo "# ----------------------------------------------"
		git log --graph --oneline
		echo "# ----------------------------------------------"

	# --------------------
elif [ $a -eq 11 ]; then
		# Fotos optimieren (Web, Latex)
		# Scriptaufruf
		./$scripte/optiWebLatex.sh

	# --------------------
elif [ $a -eq 12 ]; then
		# PDF-Versionen erstellen
		# Scriptaufruf
		./$scripte/pdfVersionen.sh

	# --------------------
elif [ $a -eq 13 ]; then
		# Backup (archiv/*.zip & *.tar.gz)
		echo "+++ Backup (archiv/*.zip & *.tar.gz)"
		# Speicher - Laufwerk vorhanden?
		if [ ! -d $SSD ]; then
		  echo "SSD Laufwerk 'virtuell' mounten."
		else
		  # backup extern
		  rsync -avzhEP --delete ./ $backup/$pdfname/
			echo "# ----------------------------------------------"
		  echo "+++ Backup ($backup/)"
			echo "# ----------------------------------------------"
		fi

		# Ordner vorhanden?
		if [ -d $pdfname ]; then
		  # archiv
		  cd $pdfname
		  tar cvzf ../$archiv/"$timestamp"-$pdfname.tar.gz .
		  rm -rf ../$archiv/$pdfname.zip
		  zip -r ../$archiv/$pdfname.zip .
		  cd ..
			echo "# ----------------------------------------------"
		  echo "+++ Backup ($archiv/) fertig."
			echo "# ----------------------------------------------"
		fi
		echo "fertig"

	# --------------------
	else
		echo "+++ $info"
		echo "fertig"; break
	fi
done
