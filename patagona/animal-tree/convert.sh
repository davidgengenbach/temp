#!/usr/bin/env bash

EXTENSION=png

for file in *.dot; do
  echo "Processing: ${file}"
  filename=$(basename -- "$file")
  extension="${filename##*.}"
  filename="${filename%.*}"
  dot -T${EXTENSION} $file > images/${filename}.${EXTENSION}
done