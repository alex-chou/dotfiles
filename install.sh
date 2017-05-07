#!/bin/bash

BASE=`dirname $(readlink -f "$0")`

#############
# SETUP GIT #
#############
git config --global color.ui true
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.scrub "!git ls-files --deleted -z | xargs -0 git rm"

git config --global user.name "alex-chou"
git config --global user.email "chou.alexander@gmail.com"

########################
# SETUP CURL (for vim) #
########################
if [ ! $(command -v curl) ] ; then
    echo "You do not have curl installed, would you like to install it?"
    select yn in "Yes" "No" ; do
        case $yn in
            Yes ) sudo apt-get -y install curl; break;;
            No ) exit;;
        esac
    done
fi

##################
# DOTFILES SETUP #
##################
dotfiles=(       \
    .tmux.conf   \
    .vimrc       \
    .zprofile    \
    .zshrc       \
)

dotdirs=(       \
    .vim        \
)

OGFILES=$BASE/.og-dotfiles
mkdir -p $OGFILES
echo "All original files will be moved to $OGFILES"

for df in "${dotfiles[@]}"; do
    if [ -e ~/$df ]; then
        if [ -L ~/$df ]; then
            echo "Removing link [ $df -> $(readlink ~/$df) ]"
            rm -f ~/$df
        else
            echo "Moving file [ ~/$df -> $OGFILES/$df ]"
            mv -f ~/$df $OGFILES/$df
        fi
    fi

    echo Linking $df
    ln -s $BASE/$df ~/$df
done

for dd in "${dotdirs[@]}"; do
    if [ -e ~/$dd ]; then
        if [ -L ~/$dd ]; then
            echo "Removing link [ $dd -> $(readlink ~/$dd) ]"
            rm -f ~/$dd
        else
            echo "Moving file [ ~/$dd -> $OGFILES/$dd ]"
            mv -f ~/$dd $OGFILES/$dd
        fi
    fi

    echo Linking $dd
    ln -s $BASE/$dd ~/$dd
done
