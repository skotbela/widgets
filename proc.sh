#!/bin/bash

process_number=$(ps axu | wc -l)
echo "Number of running processes: $process_number"


