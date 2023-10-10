README.preface:
	cat $@

index:
	zk index
README.index: index
	zk list > $@
README.md: README.preface README.index
	cat $? |\
		sed -e 's/\([A-Za-z0-9]*\.md\)/[\1](\1)/' |\
		tee $@

watch-REAMDE.md:
	while inotifywait -qqe modify README.md; do bat README.md; done
