#!/bin/bash -e
# Letztes Update: 6-Apr-2019
# Markdown --> Latex & HTML5 & Wordpress"

# variable
#work=~/tex/projekt
md="md"
tex_pandoc="tex-pandoc"
html="html"
cms_wp_lokal="cms-wp-lokal"
cms_wp_server="cms-wp-server"
#---------------------------
echo "+++ Markdown --> Latex & HTML5 & Wordpress"
cd $md
for i in *.md; do
	filename=`basename "$i" .md`
	# Latex
	pandoc "$i" -o ../$tex_pandoc/$filename.tex
	# Wordpress
	pandoc "$i" --to=html5 -o ../$cms_wp_lokal/$filename.html
	pandoc "$i" --to=html5 -o ../$cms_wp_server/$filename.html
	# HTML5
	pandoc -s "$i" --to=html5 -o ../$html/$filename.html
done
cd ..

echo "fertig"
