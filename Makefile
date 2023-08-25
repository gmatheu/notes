
README.preface:
	cat $@
README.index:
	zk index
	zk list > $@
README.md: README.preface README.index
	cat $? | tee $@
