#!/bin/bash

[ -f ./.suite ] && source .suite

compile_task() {
  if [[ "$RUNNER" == "cpp" ]]; then
    echo " » Compile task.cpp"
    if [ -f task.cpp ]; then
      c++ task.cpp -o task
    else
      echo " » No file for compilation"
    fi
  fi
}

__run_task() {
  if [[ "$RUNNER" == "cpp" ]]; then
    [ -f ./task ] && ./task
  else
    python3 task.py
  fi
}

run_task() {
  TAG=$1
  echo " » Run test number $TAG.."
  cat tests/input.$TAG.txt | \
    __run_task > tests/actual.$TAG.txt && \
    diff tests/actual.$TAG.txt tests/expected.$TAG.txt
}

run_test() {
  run_task $1
}

############ Add test runs here ############
#
#
run_suite() {
  run_test 0
}
############ Add test runs here ############

create_test() {
  mkdir -p tests
  touch tests/input.$1.txt
  touch tests/expected.$1.txt
  if [[ "$EDITOR" != "" ]]; then
    $EDITOR tests/input.$1.txt tests/expected.$1.txt
  fi
}

case $1 in
  "") compile_task; run_suite ;;
  "test") create_test $2 ;;
esac
