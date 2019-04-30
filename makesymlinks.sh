#!/bin/bash
#title		:makesymlinks.sh
#description	:create symlinks to the dotfiles in this repository and back up old .files
#author		:icalvin102

backupdir=~/.dotfiles_backup/$(date +"%Y%m%d-%H%M%S")
currentdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p $backupdir

for filepath in ${currentdir}/dotfiles/.*; do
    filename=$(basename "$filepath")
    if [ "$filename" != "." ] && [ "$filename" != ".." ] ; then
        echo "$filename"
        if [ -f ~/$filename ] || [ -d ~/$filename ] && [ ! -L ~/$filename ] ; then
            echo "backing up $filename"
            mv ~/$filename $backupdir/$filename
        fi
        echo "linking $(realpath $filepath) to ~/$filename"
        ln -sf $(realpath $filepath) ~/$filename
        fi	      
    done

    echo "cleaning up"
    rmdir --ignore-fail-on-non-empty $backupdir
    rmdir --ignore-fail-on-non-empty ~/.dotfiles_backup
    echo "finished"

