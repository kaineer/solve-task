all:
	./suite.sh
python:
	echo "RUNNER=python" > .suite
	./suite.sh
cpp:
	echo "RUNNER=cpp" >.suite
	./suite.sh

test:
	./suite.sh task ${TAG}
.PHONY: test
