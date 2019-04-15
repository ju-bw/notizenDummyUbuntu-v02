#!/bin/bash -e
# Letztes Update: 14-Apr-2019

# bash vorlage

# Variable
info="bash vorlage"
timestamp=$(date +"%Y-%h-%d_%H:%M") # Archiv
timestamp_2=$(date +"%d-%h-%Y")     # Letztes Update
copyright="ju - Letztes Update: $timestamp_2"

# ----------------------------
# code
echo "+++ $info"
echo "+++ $copyright"


# ----------------------------
echo "fertig"

# HINWEIS
# vi Zeilennummer
#   set nu    # an
#   set nonu  # aus

# Vollzugriff auf Eigentümer (4+2+1 = 7). kein Zugriff (0) für Gruppe u. Gast:
# chmod 700 *.sh

# Script überall ausführbar machen
# cp -Rp *.sh /usr/local/bin/
# chown -R jan.root /usr/local/bin/
# script.sh oder bash sript.sh
