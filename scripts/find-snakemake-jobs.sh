#!/usr/bin/env bash
set -eo pipefail

[[ $# -ne 1 && ! -e $1 ]] \
  && echo "Please enter a path to search..." \
  && exit 1

[[ $(basename $(readlink -f $1)) != ".snakemake" ]] \
  && echo "Error: Path must be to .snakemake folder" \
  && exit 1

[[ ! -e "$1/slurm_logs" ]] \
  && echo "Error: no slurm_logs folder found" \
  && exit 1

ret=$(\
  find "$1/slurm_logs" -name "*.log" -printf "%f\n" \
  | sed -r 's/([0-9]+).*/\1/')

[[ -z "$ret" ]] || echo "$ret"

