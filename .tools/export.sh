#/bin/bash 
set -eo pipefail

EXPORTS=(
  "rg" "htop" "zsh" "git" "tmux"
)

env_path="$(readlink -f "$HOME")/.tools/conda/envs/dots"
output_path="$(readlink -f "$HOME")/bin"

function write_script() {
  ret=$(
		cat <<-EOF
			#!/bin/bash
			if [[ "\$CONDA_PREFIX" != "$env_path" ]]; then
			  micromamba -p $env_path run $1 "\$@"
			else
			  \$CONDA_PREFIX/bin/$1 "\$@"
			fi
		EOF
  )

  echo -e "$ret" > $output_path/$1
  chmod +x $output_path/$1
}


for exp in ${EXPORTS[@]}; do
  if [ -e $env_path/bin/$exp ]; then
    echo "---Exporting $exp"
    write_script "$exp"
  fi
done


