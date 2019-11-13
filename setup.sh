#!/usr/bin/bash

# link dotfiles
dt=`date '+%Y%m%d_%H%M%S'`
bu=~/.dotfiles/backup/$dt
mkdir -p $bu

function linker() {
  if test -e ~/$1; then
    echo "Backup of ~/$1"
    cp -RL ~/$1 $bu
    rm -rf ~/$1
  fi
  ln -s ~/.dotfiles/$1 ~/$1
}

linker .bashrc
linker .bash_profile
linker .gitconfig
linker .initrc
linker .tmux.conf
linker .zshrc
