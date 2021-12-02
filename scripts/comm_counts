#!/bin/bash
set -eo pipefail

comm --output-delimiter=, "$1" "$2" \
  | awk -F, -v col1=0 -v col2=0 -v col3=0 '
  {
    if ($1) {
      col1 ++
    }
    if ($2) {
      col2 ++
    }
    if ($3) {
      col3 ++
    }
  } END {
    printf("File1\tFile2\tIntersect\n%s\t%s\t%s\t\n", col1, col2, col3)
  }' | column -t

