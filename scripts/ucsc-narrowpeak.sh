#!/bin/bash
set -ueo pipefail

if [ ! -f $1 ]; then
  echo "Please enter a bed / narrowPeak file..."
  exit 1
fi

input=$1
track_type=${1##*.}

echo "track type=$track_type" 

awk -v OFS="\t" '{
  if ($1 !~ /G.*|K.*/) {
    if ($1 == "MT") {
      $1 = "M"
    }
    print "chr" $0
  }
}' $input

