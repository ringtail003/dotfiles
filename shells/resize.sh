#!/bin/bash

file=$1
size=$2

if [ -z "$1" ]; then
  echo "== Usage =="
  echo "$(basename $0) source.png"
  exit 1;
fi

after=`echo $file | sed -e "s/\./-$size./"`
convert "$1" -resize "$size""x>" "$after"

echo "Resized."
identify "$after"
