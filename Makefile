
README.preface:
	cat $@
README.index:
	zk index
	zk list > $@
README.md: README.preface README.index
	cat $? |\
		sed -e 's/\([a-z1-9]*\.md\)/[\1](\1)/' |\
		tee $@
