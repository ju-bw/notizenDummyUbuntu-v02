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
