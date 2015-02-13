#!/bin/bash

#########################################################################
# dotfiles.bash
# 
# "./dotfiles.bash install" will install all dotfiles via simlinks
# pre-existing dotfiles will be saved in ./old_dotfiles
#
# "./dotfiles.bash restore will do the reverse, deleting the symlinks
# and moving the old dotfiles back
#########################################################################

sourceDir=$(pwd)

#Which dotfiles to install/restore
files="vim vimrc bashrc tmux.conf"

#Dump a backup of the old dotfiles here
oldDir=$sourceDir/old_dotfiles

#Usually home, though could be something else for testing
targetDir=$HOME

function parseInputs(){
    while test $# -gt 0; do
        case $1 in
            "help")
                printHelp
                ;;
            "install")
                installDotfiles
                ;;
            "restore")
                restoreDotfiles
                ;;
        esac
        shift
    done
}

function installDotfiles() {
    #Create the dirs if needed
    mkdir -p $oldDir

    for file in $files; do
        #Backup the old dotfile without the leading .
        if [ -a $targetDir/.$file ]; then
            mv $targetDir/.$file $oldDir/$file
        fi

        #symlink the git'd dotfile in the target dir
        ln -s $sourceDir/$file $targetDir/.$file
    done
}

function restoreDotfiles() {
    for file in $files; do
        #If the symlink exists in the target directory, delete it
        if [ -L $targetDir/.$file ]; then
            rm $targetDir/.$file
        fi

        #If we have a backup to of it, move it back
        #This is needed since there may not have been a config file at all on install
        if [ -a $oldDir/$file ]; then
            mv $oldDir/$file $targetDir/.$file
        fi
    done
}

function printHelp() {
    echo "This is the help, though Joe hasn't actually written it yet"
}

parseInputs "$@"
