# Functions 

# Libeoffice - Calc
loc() {
    libreoffice --calc --nologo --nolockcheck --norestore --nodefault $@ &
}

# Libeoffice - Writer
low() {
    libreoffice --writer --nologo --nolockcheck --norestore --nodefault $@ &
}

hist() {
  histfile="$HOME/.zsh/history"
  cut -f 2- -d' ' $histfile\
    | sed -r 's/([0-9]+):0;(.*)$/\1\t\2/' \
    | awk -F '\t' '{$1=strftime("%Y%m%d-%T", $1); print $0}'
}

rc() {
  rev <(echo "$1") | tr ATCGatcg TAGCtacg
}

