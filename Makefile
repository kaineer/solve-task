all:
	./suite.sh
python:
	echo "RUNNER=python" > .suite
	./suite.sh
cpp:
	echo "RUNNER=cpp" >.suite
	./suite.sh

test:
	./suite.sh test ${TAG}
help:
	./suite.sh help
h: help

.PHONY: test help h
