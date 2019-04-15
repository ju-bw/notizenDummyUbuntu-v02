# Readme

<!-- ju - 12-Apr-19 -->

Erstellt Websiten & Latex PDFs mit Markdown und pandoc.

Sed passt die Syntax annotizen

Versionsverwaltung: git

## Hinweis

Projekt getestet unter Ubuntu 18.04.2 LTS.

## Projekt erstellen

Das Script "pdfname-umbenennen.sh" sucht und ersetzt den pdfnamen.

ACHTUNG: Script außerhalb vom neu-notiz-proj ausführen.

~~~
  # Shell
  # Repository  von Github downloaden
  $ git clone git@github.com:ju-bw/notizenDummyUbuntu-v02.git neu-notiz-proj/
  $ cp neu-notiz-proj/pdfname-umbenennen.sh .

  # Script anpassen
  $ vi pdfname-umbenennen.sh
  $ ./pdfname-umbenennen.sh

  $ cd neu-notiz-proj/
  $ ./projekt.sh
~~~

## Software

Pandoc: <https://pandoc.org/installing.html>

Latex: <https://www.tug.org/texlive/acquire-netinstall.html>

~~~
  # Shell
  # TeXlive update
  $ tlmgr update --all
~~~

Editor:

<https://code.visualstudio.com/download>

<https://atom.io/>

Git: <https://git-scm.com/downloads>

~~~
  # Shell
  # Git version
  $ git --version
~~~

Imagemagick: <https://www.imagemagick.org/script/download.php#windows>


## Repository  von Github downloaden

Repository = notizenDummyUbuntu-v02.git

~~~
  # Shell
  # Github Repository downloaden
  $ git clone git@github.com:ju-bw/notizenDummyUbuntu-v02.git .
  # oder
  $ git clone https://github.com/ju-bw/notizenDummyUbuntu-v02.git .
  # lokales backup repository
  $ git clone /media/jan/virtuell/git-server-repo/notizenDummyUbuntu-v02-backup.git .
~~~

## Neues Repository auf Github anlegen

<https://github.com/new>

Create a new repository

Repository name = notizenDummyUbuntu-v02

~~~
  # Voraussetzung:
  #
  # lokales Repository: HEAD -> master
  git init # rm -rf .git
  git commit -am "Projekt init"
  #
  # Github Repository: origin/master
  adresse="github.com:ju-bw"
  git remote add origin git@$adresse/notizenDummyUbuntu-v02.git
  git push -u origin master
  #
  # lokales backup Repository: backup/master
  SSD="/media/jan/virtuell/git-server-repo"
  git clone --no-hardlinks --bare . $SSD/notizenDummyUbuntu-v02-backup.git
  git remote add backup $SSD/notizenDummyUbuntu-v02-backup.git
  git push --all backup
~~~

~~~
  # Shell: Git Befehle
  #
  # ".gitconfig", ".gitignore" erstellen und konfigurieren
  #
  # git versionieren
  git add .
  git commit -a # Editorauswahl: sudo update-alternatives --config editor
  git status
  git log --graph --oneline

  # github repository
  git status
  git pull
  git push
  git log --graph --oneline

  # lokales backup repository
  git push --all backup # sichern
  git status
  git log --graph --oneline

  # branch erstellen
  git checkout -b work
  git checkout work
  # projekt bearbeiten
  git checkout master
  git merge work

  git status
  git log --graph --oneline # beenden q
  git log --graph --pretty=format:";  %cn;  %h;  %ad;  %s" --date=relative > $file
~~~

## Markdown Dokumente / Notizen verfassen

Markdown Dokumente / Notizen im Ordner "md/neu.md" erstellen.

~~~
  # Markdown

  <!--ju - Letztes Update: 6-Apr-19  -->

  ## Quellcode

  siehe code. Codename

  ~~~
    # Überschrift
    ## Überschrift 2
    ### Überschrift 3
  ~~~

  ## Bild

  Bilder in pdf speichern, notwendig für Latex.

  siehe pic. logo.pdf

  ![Logo](img/logo.pdf)

  ![Bild](https://cdn.pixabay.com/photo/2019/04/02/04/32/masala-4096891_960_720.jpg)

  ## Tabelle

  siehe tab. table

  |**Nr.**|**Begriffe**|**Erklärung**|
  |------:|:-----------|:------------|
  | 1     | a1         | a2		   		 |
  | 2     | b1         | b2		       |
  | 3     | c1         | c2		       |
~~~

**Scripte "projekt.sh" und "scripte/sed.sh" anpassen**

~~~
  # Shell
  $ cd neu-notiz-proj
  # Script anpassen
  $ vi scripte/sed.sh
    # file
    # codelanguage
    scripte/sed.sh  <- HTML5, Python, Bash, C, C++, [LaTeX]TeX

    # CMS server pfad
    scripte/sed.sh  <- https://www.ju1.eu/*

    scripte/sed.sh  <-  bildformat
     	pdf           -> latex
     	svg, png, jpg -> web
  $ vi projekt.sh
    # file
    # Titel -> ../pdfname-umbenennen.sh
    pdfname="notizenDummyUbuntu-v02"
    # Backup
    SSD="/home/jan/Downloads"
    backup="$SSD/backup/notizen"
~~~

**Script ausfuehren**

~~~
  # Shell
  $ cd neu-notiz-proj
  $ ./projekt.sh

  Projekt Web & Latex Ubuntu

  0) Projekt erstellen.
  1) Markdown in (tex, html5) - sed (Suchen/Ersetzen)
  2) Kopie tex (Pandoc) - tex (Handarbeit)
  3) Kapitel erstellen, Scripte ausführen
  4) TEST: PDF erstellen mit pdflatex (book.pdf)
  5) TEST: PDF erstellen mit latexmk (light.pdf)
  6) PDFs erstellen (book-, print-, artikel.pdf) - Archiv (tex)
  7) Projekt aufräumen
  8) Git-Version erstellen
  9) git status und git log --graph --oneline
  10) git init
  11) Fotos optimieren (Web, Latex)
  12) PDF-Versionen erstellen
  13) Backup (archiv/*.zip & *.tar.gz) & (/media/jan/virtuell/backup)
  14) Beenden?

  Geben Sie eine Zahl ein:
~~~

## Bilder optimieren

**JPG Bilder** in den Ordner "img-in/" kopieren.

optimiert Fotos für das Web und die PDF Datei.

## Backup

~~~
  # Shell
  $ cd neu-notiz-proj
  $ tar cvzf ../notizenDummyUbuntu-v02.tar.gz .
~~~

# Git Version Wiederherstellen

<!-- letzetes Update: 6-Apr-2019 -->

## Wiederherstellen

### Ordner für Experimente erstellen - löschen

~~~
  cd projekt
  mkdir -p work neu alt
  # löschen
  rm -rf work alt neu
~~~

### bestehendes Repository clonen

~~~
  cd # ? Repository
  git clone . ../work
~~~

### Arbeitsverzeichnis bearbeiten

**bearbeiten 1**

~~~
  cd work
  vi test.md
    # file
    Basis

  # git versionieren
  git add .
  git commit -a
  git status
~~~

**bearbeiten 2**

~~~
  vi test.md
    # file
    Basis
    2) Version

  # git versionieren
  git commit -a
  git status
~~~

**bearbeiten 3**

~~~  
  vi test.md
    # file
    Basis
    2) Version
    3) Version

  # git versionieren
  git commit -a
  git status
  git log --graph --oneline
~~~

###  Wiederherstellen: Repository in ein temp. Verzeichnis klonen

~~~
  cd work
  git clone . ../neu
  git clone . ../alt
~~~

### Wechsel auf den gewünschten Git-Branch

~~~
  cd ../neu/
  git stash
  git log --graph --oneline
  * 48eba8f (HEAD -> master, origin/master, origin/HEAD) version3
  * 69383f1 version2
  * 1ef0339 test.md basis
  * 47ac1f2 Projekt init
  # version2
  git reset --hard 69383f1
~~~

### verschiebe .git in den Workspace der alten Versionsverwaltung

~~~
  git archive master | tar -x -C ../alt/
~~~

### Ergebnis prüfen

~~~
  cd projekt
  kdiff3 alt/ neu/
~~~

## Repository clonen und von Github downloaden

### Ordner für Experimente erstellen - löschen

~~~
  cd projekt
  mkdir -p lokale-vers github-vers lokale-backup-vers
  # löschen
  rm -rf lokale-vers github-vers lokale-backup-vers
~~~

### lokales Repository

HEAD -> master

~~~
  cd work
  # repository clonen
  git clone . ../lokale-vers

  # backup
  cd ../lokale-vers
  #tar cvzf ../lokale-vers.tar.gz .
  verz="lokale-vers"
  ID=$(git rev-parse --short HEAD) # git commit (hashwert)
  timestamp=$(date +"%Y-%h-%d_%H:%M") # Datum
  tar cvzf ../"$verz"_"$ID"_"$timestamp".tar.gz .
  cd ..
~~~

### Github Repository

origin/master

~~~
  cd github-vers
  # repository clonen
  git clone git@github.com:ju-bw/notizenDummyUbuntu-v02.git .

  # backup
  #tar cvzf ../github-vers.tar.gz .
  verz="github-vers"
  ID=$(git rev-parse --short HEAD) # git commit (hashwert)
  timestamp=$(date +"%Y-%h-%d_%H:%M") # Datum
  tar cvzf ../"$verz"_"$ID"_"$timestamp".tar.gz .
  cd ..
~~~


### lokales backup Repository

backup/master

~~~
  cd lokale-backup-vers
  # repository clonen
  git clone /media/jan/virtuell/git-server-repo/notizenDummyUbuntu-v02-backup.git .

  # backup
  #tar cvzf ../lokale-backup-vers.tar.gz .
  verz="lokale-backup-vers"
  ID=$(git rev-parse --short HEAD) # git commit (hashwert)
  timestamp=$(date +"%Y-%h-%d_%H:%M") # Datum
  tar cvzf ../"$verz"_"$ID"_"$timestamp".tar.gz .
  cd ..
~~~


### Ergebnis prüfen

~~~
  cd projekt
  # verzeichnisse vergleichen
  kdiff3 lokale-vers/ github-vers/ lokale-backup-vers/
  # files vergleichen
  kdiff3 lokale-vers/Readme.md github-vers/Readme.md
~~~


### build - Versionen erstellen

~~~
  cd projekt
  ls -lh *gz
    # Inhalt
    9,3M Apr  7 19:25 github-vers_47ac1f2_2019-Apr-07_19:25.tar.gz
    9,3M Apr  7 18:21 github-vers.tar.gz
    9,4M Apr  7 19:25 lokale-backup-vers_47ac1f2_2019-Apr-07_19:25.tar.gz
    9,4M Apr  7 18:21 lokale-backup-vers.tar.gz
    9,4M Apr  7 19:24 lokale-vers_48eba8f_2019-Apr-07_19:24.tar.gz
    9,4M Apr  7 18:20 lokale-vers.tar.gz
~~~

### build - Versionen erstellen

~~~
  file="MD5-Hash.txt"
  printf "# --------------------------------\n"   >  $file
  printf "# build - Versionen   \n"   >> $file
  printf "# lokale-vers:        \n"   >> $file
  printf "# github-vers:        \n"   >> $file
  printf "# lokale-backup-vers: \n"   >> $file
  printf "# Datum: 			  	    \n"   >> $file
  printf "# Git - Hashwert:     \n"   >> $file
  printf "# MD5-Hash:           \n"   >> $file
  printf "# --------------------------------\n\n" >> $file

  # hashwert erstellen
  md5sum github-vers_47ac1f2_2019-Apr-07_19:25.tar.gz        >> $file
  md5sum lokale-backup-vers_47ac1f2_2019-Apr-07_19:25.tar.gz >> $file
  md5sum lokale-vers_48eba8f_2019-Apr-07_19:24.tar.gz        >> $file

  # build - Versionen
  vi MD5-Hash.txt
~~~
