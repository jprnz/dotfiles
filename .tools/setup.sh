#!/bin/env bash
set -eo pipefail

error() {
  echo "Error: $@"
  exit 1
}

url="https://micro.mamba.pm/api/micromamba/linux-64/latest"
mamba_path="$HOME/bin/micromamba"

# Create bin if needed
[[ -e $HOME/bin ]] || mkdir $HOME/bin
export PATH="$HOME/bin:$PATH"
export MAMBA_ROOT_PREFIX="$HOME/.tools/conda"
export MAMBA_ALWAYS_YES=yes

# Download and install
if [[ ! -e $mamba_path ]]; then
	echo "---Installing conda..."
	(
		curl -L "$url" | tar -xvj "bin/micromamba" \
			&& mv bin/micromamba $mamba_path \
			&& rm -r bin
	) || error "Could not download Miniconda from: $conda_url"
fi


# Install env.yaml
echo "---Installing environment..."
(
	micromamba create -f env.yaml \
		&& micromamba clean -af
	[[ -e $HOME/.mamba ]] && rm -r $HOME/.mamba
) || error "Could not create analysis environment"

# Add exports
echo "---Exporting tools..."
(
	bash export.sh
) || error "Exporting tools..."

echo "All done, setup sucessful!"

