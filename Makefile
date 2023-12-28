all:
	rm -f Esperanto.mp4
	rm -f JPG/Esperanto*.jpg
	rm -f PDF/Esperanto.pdf
	install -d JPG
	install -d PDF
	install -d ${HOME}/.local/share/fonts/
	install TTF/Inkfree.ttf ${HOME}/.local/share/fonts/Inkfree.ttf
	install TTF/Arial.ttf ${HOME}/.local/share/fonts/Arial.ttf
	cd PDF && /usr/bin/soffice --headless --convert-to pdf ../Esperanto.odp
	convert-im7 -verbose -density 300 -quality 95 -resize 1920x1080 PDF/Esperanto.pdf JPG/Esperanto%02d.jpg
	ffmpeg -y -framerate 1/30 -i JPG/Esperanto%02d.jpg -c:v libx264 -x264-params keyint=30:scenecut=0 -vf "fps=10,format=yuv420p" Esperanto.mp4
