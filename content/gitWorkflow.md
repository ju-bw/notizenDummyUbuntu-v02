# Git Workflow

% ju - 26-Okt-18

## git log

Commits, Referenzen, Verzweigungen und Zusammenführungen visualisieren.

**GitViz** <https://github.com/Readify/GitViz/releases>

~~~
  git log --oneline  # less beenden mit <Shift+q>
  git log --graph --oneline
  git log --graph --pretty=format:";  %cn;  %h;  %ad;  %s" --date=relative > log.txt
~~~

## branch erstellen - wechseln - löschen

~~~
  git branch
  git checkout -b entwicklung # erstellen u. wechseln
  git checkout master         # wechsel auf master
  git checkout entwicklung    # wechsel auf entwicklung
  git branch -d entwicklung   # loeschen
~~~

## Entwicklungs Zweig

Projekt neu erstellen

~~~
  # git config u. .gitignore
  # +++ files erstellen
  git init
  git status
  git add . # lokale aenderungen
  git commit -am"projekt start"
  # Entwicklungszweig erstellen u. wechseln
  git checkout -b entwicklung
  git log --oneline
    b7a87de (HEAD -> entwicklung, master) projekt start
~~~

**Projekt bearbeiten**

~~~
  git branch
    * entwicklung
      master
  # auf "entwicklung" branch wechseln    
  git checkout entwicklung    # wechsel auf entwicklung
  # +++ files bearbeiten
  git status
  git add . # lokale aenderungen
  git commit -am"kommentar"
  git branch
  git checkout master         # wechsel auf master
  git log --oneline
  #git diff file
  git merge entwicklung       # zusammenfuehren
  git log --oneline
~~~

**Version erstellen**

~~~
  # auf "master" branch wechseln
  git tag v-01 letzter commit
~~~

**Letzter Stand rückgängig machen**

~~~
  git log --oneline
  git revert "letzterCommit"
  git reset --hard "zielCommit"
~~~

## Arbeiten im Team

### lokaler Server

lokales Repository erstellen (zentrales Repository)

~~~
  # auf "master" branch wechseln
  git clone --bare . ../projekt.git
  git status
  # aenderungen veroeffentlichen
  git pull ../projekt.git master
  git push ../projekt.git master
  git log --oneline
    f3d7d67 (HEAD -> master) Merge branch 'entwicklung'
~~~

Arbeitskopie erstellen

~~~
  git clone ../projekt.git .
~~~

### github Server

Remote Repository auf github erstellen

<https://github.com/ju-bw?tab=repositories>

github: Create a new repository

Repository name = projekt



~~~
  # auf "master" branch wechseln
  # aenderungen veroeffentlichen
  git remote add origin https://github.com/ju-bw/projekt.git
  git push -u origin master
  git status
  git pull
  git push
  git log --oneline
    f3d7d67 (HEAD -> master, origin/master) Merge branch 'entwicklung'
~~~

Arbeitskopie erstellen

~~~
  git clone https://github.com/ju-bw/projekt.git .
~~~
