# Modules can overwrite FPATH
# This restores lost directories
#

FPATH_DEFAULT="/usr/share/zsh/site-functions:/usr/share/zsh/4.3.11/functions"

if [ -z $FPATH ]; then
	echo "Adding \$PATH..."
	export FPATH=$FPATH_DEFAULT
else
	if echo "$FPATH" | grep -vq $FPATH_DEFAULT; then
		echo "Fixing \$FPATH..."
		export FPATH=$FPATH_DEFAULT:$FPATH
	fi
fi


