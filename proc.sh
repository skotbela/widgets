#!/bin/bash

line_number=$(ps axu | wc -l) # The command wc provides lineCount (-l), wordCount (-w), and charCount (-c)
process_number=$((line_number-1))
echo "Number of running processes: $process_number"


