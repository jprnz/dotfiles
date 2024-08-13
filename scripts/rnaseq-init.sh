#!/bin/bash
set -euo pipefail

error() {
  echo "Error: $@"
  exit 1
}

# Project path and sftp credentials
project="$1"
sftpcred="$2"

# Output paths
fastq_path="$project/data/"
fastq_file="$project/config/fastqs.tsv"
sample_file="$project/config/samples.tsv"

if [ ! -e $project ]; then
  (
    echo "Creating project path..."
    git clone git@gitlab.oit.duke.edu:sgt-workflows/rnaseq-deseq2-star.git $project
  ) || error "Could not setup project: $project_path"
fi

(
  echo "Downloading data..."
  mkdir -p "$fastq_path"
  cd "$fastq_path"
  lftp -u "$sftpcred" sftp://dnaseq2.igsp.duke.edu -e "mirror -P10 .; bye"
) || error "Could not download data"


(
  echo "Lookings for FASTQ files..."
  fastqs=$(find $fastq_path -name "*.fastq.gz" \
    | sed -r 's/.*\/(.*)_S[0-9]+_L[0-9]+_(R[12]).*/\1\t\2\t\0/g' \
    | sort -k3,3V)
  echo "  FASTQs found: $(echo "$fastqs" | wc -l)..."

  if [[ ! -z "$fastqs" ]]; then
    echo "  Writting FASTQs file to: $fastq_file..."
    echo -e "sample\tpair\tpath" > $fastq_file
    echo "$fastqs" >> $fastq_file
  else
    error "Could not find fastq files or determine pairs"
  fi
) || error "Could not create fastq file: $fastq_file"

# Get sample names from fastq files
(
  echo "Lookings for FASTQ files..."
  samples=$(tail -n+2 $fastq_file | cut -f1 | sort -V | uniq)
  echo "  Samples found: $(echo "$samples" | wc -l)..."
  if [[ ! -z "$samples" ]]; then
    echo "Writting samples to: $sample_file..." 
    echo -e "sample\tcondition" > $sample_file
    echo "$samples" | awk -vOFS="\t" '{print $0, $0}' >> $sample_file
  else
    error "Could not find samples in FASTQ file"
  fi
) || error "Could not create sample file: $sample_file"

  
