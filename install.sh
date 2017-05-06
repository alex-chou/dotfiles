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

dotfiles=(      \
    .zshrc       \
    .zprofile    \
    .tmux.conf   \
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


