#!/bin/bash

path="$PWD"
conda_url="https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"
conda_file=$(basename $conda_url)
error() {
  echo "Error: $@"
  exit 1
}

help_message() {
  echo "Usage: ./setup.sh [OPITON]..."
  echo "Options:"
  echo "  -r, --run      run setup"
  echo "  -v, --verbose  display logs as setup runs"
  echo "  -h, --help     display this message"
  exit
}

env_create() {
  (
    source conda/bin/activate base
    mamba env create -f $1
  ) &> $log || error "Could not install $1"
}

# Parse command line options
run=""
log=/dev/null
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -v|--verbose) log=/dev/stdout; shift ;;
    -r|--run) run=true ;;
    -h|--help) print_help ;;
    *) echo "Unknown parameter passed: $1" && help_message ;;
  esac
  shift
done

# Requre run
[ $run ] || help_message

echo "---Installing conda..."
(
  # Existing conda directory
  if [ -d "$path/conda" ]; then
    error "Conda directory already exists. To reinstall, remove and try again."
  fi

  # Download
  [ -e $conda_file ] && rm $conda_file
  curl -O $conda_url

  # Install
  bash $conda_file -b -p "$path/conda" && rm $conda_file
) &> $log || error "Could not install conda"

echo "---Installing packages..."
(
  for env_file in envs/*.yaml; do
    echo "----- $(basename $env_file)" 
    env_create $env_file
  done
)

