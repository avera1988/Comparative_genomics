#!/bin/bash
filename="$1"
dir="$2"
while read -r line
do
    name="$line"
      cp  $name $dir
done < "$filename"

