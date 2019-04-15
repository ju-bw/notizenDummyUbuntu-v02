#!/bin/bash -e
# Letztes Update: 6-Apr-2019
# Git versionieren

# Variable
info="Git versionieren"
timestamp_2=$(date +"%d-%h-%Y")
copyright="ju $timestamp_2"

# ----------------------------
echo "+++ $info"

# Voraussetzung:
#
# lokales Repository: HEAD -> master
# git init
# git commit -am "Projekt init"
#
# Github Repository: origin/master
# adresse="github.com:ju-bw""
# git remote add origin https://$adresse/notizenDummyUbuntu-v02.git
# git remote add origin git@$adresse/notizenDummyUbuntu-v02.git
# git push -u origin master
#
# lokales backup Repository: backup/master
# SSD="/media/jan/virtuell/git-server-repo"
# git clone --no-hardlinks --bare . $SSD/notizenDummyUbuntu-v02-backup.git
# git remote add backup $SSD/notizenDummyUbuntu-v02-backup.git
# git push --all backup

# Git-Version
# lokales Repository: HEAD -> master
#
# usereingabe
read -p "lokales Repository vorhanden? [j/n] " a
if [ -z "$a" ]; then
  # String ist leer
  echo "Keine Eingabe"
fi
if [ "$a" = "j" ]; then
  # lokales Repository: HEAD -> master
  git add .
  git commit -a # editor
  echo "# ------------------------"
else
  # beenden
  echo "Ende: $a"
fi

# Github Repository: origin/master
#
# usereingabe
read -p "Github repository vorhanden? [j/n] " a
if [ -z "$a" ]; then
  # String ist leer
  echo "Keine Eingabe"
fi
if [ "$a" = "j" ]; then
  # Github Repository: origin/master
  git push
  echo "# ------------------------"
else
  # beenden
  echo "Ende: $a"
fi

# lokales backup Repository: backup/master
#
# usereingabe
read -p "lokales backup repository vorhanden? [j/n] " a
if [ -z "$a" ]; then
  # Fehler: String ist leer
  echo "Keine Eingabe"
fi
if [ "$a" = "j" ]; then
  # Speicher - Laufwerk vorhanden?
  if [ ! -d $SSD ]; then
    echo "SSD Laufwerk 'virtuell' mounten."
  else
    # lokales backup Repository: backup/master
    git push --all backup # sichern
    echo "# ------------------------"
  fi
else
  # beenden
  echo "Ende: $a"
fi

echo "# ------------------------"
git status
git log --graph --oneline
echo "# ------------------------"

echo "fertig"
