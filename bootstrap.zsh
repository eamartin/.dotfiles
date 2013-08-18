#!/bin/zsh

dir=`dirname $0`

config=(.gitconfig .global_gitignore .tmux.conf .emacs.d)

for f in $config; do
    echo "Symbolically linking ~/$f to $dir/$f"
    rm -rf ~/$f
    ln -s $dir/$f ~/$f
done
