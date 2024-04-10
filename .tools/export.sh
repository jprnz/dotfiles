#/bin/bash 
set -eo pipefail

EXPORTS=(
  "rg" "htop" "zsh"
)

env="dots"
conda_path="$(readlink -f "$HOME")/.tools/conda"
output_path="$(readlink -f "$HOME")/bin"

function write_script() {
  [ -d $output_path ] || mkdir -p $output_path
  ret=$(
    cat <<-EOF
			#!/bin/bash
			env_prefix="$conda_path/envs/$env"
      this_prefix="\$(readlink -f "\$CONDA_PREFIX")"
      if [[ "\$this_prefix" == "\$env_prefix" ]]; then
        source "$conda_path/bin/activate" $env
      fi
      exec "\$CONDA_PREFIX/bin/$1" "\$@"
		EOF
  )

  echo "$ret" > $output_path/$1
  chmod +x $output_path/$1
}


set -x
for exp in ${EXPORTS[@]}; do
  # Write script if found
  if [ -e $conda_path/envs/$env/bin/$exp ]; then
    echo "---Exporting $exp"
    write_script "$exp"
  fi
done


