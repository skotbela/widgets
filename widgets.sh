#!/bin/bash
./mem.sh
./proc.sh
./user.sh
./disk.sh

if [ -z ${WIDGET_CONTROL+x} ];
  then
    ./mem.sh
    ./cpu.sh
  else
    echo "var is set to '$WIDGET_CONTROL'";
fi
