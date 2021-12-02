#/bin/bash 
set -eo pipefail

EXPORTS=(
  "htop" "nnn" "tmux" "vim" "rg" "fzf" "ctags"
  "black" "node"
)

path=$(readlink -f $(dirname $0))
conda_path=$path/conda
output_path=$path/bin

function write_script() {
  ret=$(
    cat <<-EOF
			#!/bin/bash
			set -eo pipefail

			source $conda_path/bin/activate $1
			$2
		EOF
  )

  echo "$ret" > $output_path/$2
  chmod +x $output_path/$2
}


for exp in ${EXPORTS[@]}; do

  # Split env if given / otherwise search all envs
  exp_arr=(${exp/\// })
  if [ ${#exp_arr[@]} -eq 1 ]; then
    env="*"
    cmd="${exp_arr[0]}"
  else
    env="${exp_arr[0]}"
    cmd="${exp_arr[1]}"
  fi

  # Find command
  cmd_path=$(find $conda_path/envs/$env/bin -name "$cmd")

  # Write script if found
  if [ ! -z $cmd_path ]; then

    # Get env if not given
    if [ "$env" == "*" ]; then 
      env=$(dirname "${cmd_path/$conda_path\/envs\//}")
      env=${env/\/*/}
    fi

    echo "---Exporting $exp"
    [ -d $output_path ] || mkdir -p $output_path
    write_script "$env" "$cmd"
  fi
done


