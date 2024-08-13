#!/bin/bash
set -eo pipefail

order_path="/data/seqcore"
orders=($(find $order_path -maxdepth 2 | grep -P "[0-9]{4,}"))

for dir in ${orders[@]}; do
  if [[ -e $dir/.snakemake/slurm_logs ]]; then
    ord=$(basename $dir | sed -r 's/.*([0-9]{4,}).*/\1/g')
    awk -v ord="$ord" \
      '{S += $2}; END {print ord, S, S/60, S/60 * 0.02}' \
      <(find-snakemake-jobs.sh $dir/.snakemake | job-stats.pl)

  fi
done

