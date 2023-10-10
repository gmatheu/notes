README.preface:
	cat $@

index:
	zk index
README.index: index
	zk list > $@
README.md: README.preface README.index
	cat $? |\
		sed -e 's/\([a-z0-9]*\.md\)/[\1](\1)/' |\
		tee $@
