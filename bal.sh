#!/bin/bash

for i in {1..10}; do
  output=$(bal run ballerina/compile_time_loop.bal -- input-text.txt patterns.txt results-ballerina-compile-time-loop.txt)
  echo "Execution $i: $output"
done