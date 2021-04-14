#!/bin/bash
#./mem.sh
#./proc.sh
#./user.sh
#./disk.sh

if [ -z ${WIDGET_CONTROL+x} ]; then
  ./mem.sh
  ./cpu.sh
else
  echo "TODO // add function"
fi

i=0;
while [ "$i" -lt 6 ]; do
  file_var=$(echo "${WIDGET_CONTROL}" | cut -d',' -f"$i")
  source ./$file_var.sh
  i=$((i + 1));
done