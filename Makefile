all:
	./scripts/suite.sh
python:
	echo "RUNNER=python" > .suite
	./scripts/suite.sh
cpp:
	echo "RUNNER=cpp" >.suite
	./scripts/suite.sh

test:
	./scripts/suite.sh test ${TAG}

help:
	./scripts/suite.sh help

h: help

.PHONY: test help h
