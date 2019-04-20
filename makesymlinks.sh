#!/bin/bash

backupdir=~/.dotfile_backup/$(date +"%Y%m%d-%H%M%S")
counter=0

for filepath in ./dotfiles/*; do
	filename=$(basename $filename)
	if [ "$filename" -ne "." ] && [ "$filename" -ne ".." ] ; then
		echo $filename
		if [ -e ~/$filename ] ; then
			echo exists
		fi



		fi	      
