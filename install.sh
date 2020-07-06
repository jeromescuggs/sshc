#!/bin/bash

SCR_FLG=$1

a="/$0"; a=${a%/*}; a=${a#/}; a=${a:-.}; BASEDIR=$(cd "$a"; pwd)

# echo $BASEDIR
if [ -z "$SCR_FLG" ]; then 
    echo "checking for $HOME/.local/bin and creating if it doesnt exist"
    sleep 1
    if [ ! -d $HOME/.local/bin ]; then 
    		mkdir -p $HOME/.local/bin
    fi
    echo "installing sshc to $HOME/.local/bin..."
    sleep 1
    cp $BASEDIR/sshc $HOME/.local/bin
    echo "all done!"
    echo "to call this command globally, make sure .local/bin is in your path."
    echo "for info on how to set up path, run ./install.sh path"
fi 

if [ "$SCR_FLG" = "path" ]; then
		echo "PATH SETUP:"
		echo "copy the following and add it to your shell rc file:"
		echo " "
		echo 'if [[ -d $HOME/.local/bin ]]; then'
		echo '    export PATH="$PATH:$HOME/.local/bin"' 
		echo 'fi'
		echo " "
		echo and reload or relaunch your shell.
fi

SCR_FLG=
