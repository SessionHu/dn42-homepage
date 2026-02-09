.PHONY: all

all: cgi-bin/radio-playlist

cgi-bin:
	mkdir $@

cgi-bin/radio-playlist: cgi-src/radio-playlist.sh | cgi-bin
	cp $< $@
	chmod +x $@
