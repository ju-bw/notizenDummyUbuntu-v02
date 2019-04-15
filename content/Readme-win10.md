[# Readme

% ju -  21-Nov-18 - Readme.md

## Hinweis

Projekt getestet unter Win10

## Software

Pandoc: <https://pandoc.org/installing.html>

Latex: <https://www.tug.org/texlive/acquire-netinstall.html>

~~~
  # Shell: TeXlive update
  tlmgr update --all
~~~

Editor: <https://code.visualstudio.com/download>

~~~
  # Editor visual studio code
  # Datei / einstellungen / User settings
  {
    "php.executablePath": "C:/xampp/php/php.exe",
    "python.pythonPath": "C:/Python37/python.exe",
    "editor.tabSize": 2,           // tabulator        
    "files.eol": "\n",             // LF Linux
    "files.encoding": "utf8",      // coding    
    "files.autoSave": "afterDelay",// speichern
    "files.autoSaveDelay": 2000,   // 2s
    "editor.fontSize": 17,
    "workbench.colorTheme": "Visual Studio Dark",
    // PowerShell
    //"powershell.powerShellExePath": "C:/PowerShell6/6/pwsh.exe",
  }
~~~

Git: <https://git-scm.com/downloads>

~~~
  # Shell: Git version
  git --version
~~~

Imagemagick: <https://www.imagemagick.org/script/download.php#windows>


## Repository notizenDummy-v02 von Github downloaden

~~~
  # Shell: Kopie downloaden
  $ git clone https://github.com/ju-bw/notizenDummy-v02.git .
~~~

## neues Repository auf github anlegen

~~~
  # https://github.com/new
  # github: Create a new repository
  # Repository name = notizenDummy-v02
  # Shell: Git Befehle
  # ".gitconfig", ".gitignore" konfigurieren und erstellen
  git init
  git add .
  git commit -am "Projekt start"
  git remote add origin https://github.com/ju-bw/notizenDummy-v02.git
  git push -u origin master
  git status
  git pull
  git push
  git log --oneline  # less beenden mit <Shift+q>
  git log --graph --oneline
  git log --graph --pretty=format:";  %cn;  %h;  %ad;  %s" --date=relative > log.txt
~~~

## Markdown Dokumente / Notizen

Markdown Dokumente / Notizen im Ordner "md/neu.md" erstellen.

Beachte das *min. zwei Markdowndateien* vorhanden sein müssen.

**Powershellscript** "docKonverter-v02.ps1" erstellt LaTeX - pdf und html files.

~~~
  # Editor - Powershellscript "docKonverter-v02.ps1" anpassen
    ### Projekt
    # anpassen
    $thema = "notizenDummy-v02" # Thema
    $bildformat = "svg"    # Bildformate: svg, jpg, png
    $codeformat = "sh"     # Codeformate: c, cpp, sh, py, ps1
    $language = "Powershell"   # Latex-Code:  C, [LaTeX]TeX, Bash, Python, Powershell
~~~

**PowerShell: Script ausfuehren**

~~~
  $ ./docKonverter-v02.ps1
  ju 26-Okt-18

  Auswahlmenue
  ============

    (0) artikel.pdf schnell erstellen
    (1) artikel.pdf
    (2) book.pdf
    (3) print.pdf
    (4) alle Abbildungen.tex
    (5) alle Quellcodedateien.tex
    (6) backup - "../$archiv/$timestampArchiv-$thema.zip"
    (7) git - Repository auf github notwendig!
    (8) imgWeb.ps1 # ext. Script - Bilder optimieren (Latex/Web)
    (9) html
    (10) pandoc & suchen/ersetzen - Achtung: min. zwei Markdown Dateien notwendig !!!
    (11) Projekt reset
    (12) Projekt neu
    (13) artikel-light.pdf erstellen (ohne Inhaltsverzeichnis)
    (14) Beenden

  *********************************
  Eingabe - [Zahl]:
~~~

## Bilder optimieren

**JPG Bilder** in den Ordner "imgOriginal/" kopieren.

**Powershellscript** "#imgWeb.ps1" optimiert Fotos für das Web und die PDF Datei.

~~~
  # Shell: Script ausfuehren
  $ ./imgWeb.ps1
~~~](# Readme

% ju -- https://ju1.eu -- 27-Feb-19  -- Readme.md

## Hinweis

Projekt getestet unter Ubuntu 18.04.1 LTS

Linux-Kernel: 4.15.0-43-generic


## Software

Pandoc: <https://pandoc.org/installing.html>

Latex: <https://www.tug.org/texlive/acquire-netinstall.html>


Editor: <https://code.visualstudio.com/download>

~~~
  # Editor visual studio code
  # Datei / einstellungen / User settings
  {
    "editor.tabSize": 2,           // tabulator        
    "files.eol": "\n",             // LF Linux
    "files.encoding": "utf8",      // coding    
    "files.autoSave": "afterDelay",// speichern
    "files.autoSaveDelay": 2000,   // 2s
    "editor.fontSize": 14,
    "workbench.colorTheme": "Visual Studio Dark",
    "window.zoomLevel": 2,
  }
~~~

Git: <https://git-scm.com/downloads>

~~~
  # Shell: Git version
  git --version
~~~

Imagemagick: <https://www.imagemagick.org/script/download.php#windows>


## Repository von Github downloaden

~~~
  # Shell: Repository von Github downloaden
  git clone git@github.com:ju-bw/notizenDummyUbuntu-v02.git
~~~

## neues Repository auf github anlegen

~~~
  # https://github.com/ju-bw
  # Neues Repository auf github anlegen
  # 	Create a new repository
  # 	Repository name = notizenDummyUbuntu-v02
  # Shell: Git Befehle
  # ".gitignore" konfigurieren
  # Neues Repository lokal anlegen
  git init  # rm -rf .git oder git status
  git add .
  git commit -am "init"
  git remote add  github git@github.com:ju-bw/notizenDummyUbuntu-v02.git
  git push -u github master
  git status
  git pull
  git push
  # backup
  git clone --no-hardlinks --bare . /media/jan/virtuell/git-server-repo/notizenDummyUbuntu-v02-backup.git
  git remote add backup /media/jan/virtuell/git-server-repo/notizenDummyUbuntu-v02-backup.git
  git push --all backup # sichern
  # branch erstellen
  git checkout -b work
  git checkout work
  # projekt bearbeiten
  git checkout master
  git merge work
  git log --oneline  # less beenden mit <Shift+q>
  git log --graph --oneline
  git log --graph --pretty=format:";  %cn;  %h;  %ad;  %s" --date=relative > log.txt
~~~

## Markdown Dokumente / Notizen

Markdown Dokumente / Notizen im Ordner "md/neu.md" erstellen.

**projekt.sh** erstellt LaTeX - pdf und html files.

~~~
  # file: "projekt.sh" anpassen
    ### Projekt
    # main-book.tex               >> pdfname, Kapitel
    # main-print.tex              >> pdfname, Kapitel
    # projekt.sh                  >> pdfname
    # scripte/pdfErstellen.sh     >> pdfname
    # scripte/pdfVersionen.sh     >> pdfname
    # scripte/projekterstellen.sh >> pdfname
    # scripte/sed.sh              >> codelanguage
~~~

**Bash: Script ausfuehren**

~~~
  $ ./projekt.sh

  Projekt Web & Latex Ubuntu

  1) Projekt erstellen
  2) Markdown in (tex, html5) - sed (Suchen/Ersetzen)
  3) Kopie tex (Pandoc) - tex (Handarbeit)
  4) Kapitel erstellen, Scripte ausführen
  5) TEST: PDF erstellen mit pdflatex (book.pdf)
  6) TEST: PDF erstellen mit latexmk (light.pdf)
  7) PDFs erstellen (book-, print-, artikel.pdf) - Archiv (tex)
  8) Projekt aufräumen
  9) Git-Version
  10) Fotos optimieren (Web, Latex)
  11) PDF-Versionen erstellen
  12) Backup (archiv/*.zip & *.tar.gz) & (/media/jan/virtuell/backup)
  13) Beenden?
~~~

## Fotos optimieren (Web, Latex)

**JPG Bilder** in den Ordner "img-in/" kopieren.

optimiert Fotos für das Web und die PDF Datei.


## Backup

~~~
  tar cvzf ../notizenDummyUbuntu-v02.tar.gz .
~~~

)
