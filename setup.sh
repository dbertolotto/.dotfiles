#!/usr/bin/bash

# link dotfiles
dt=`date '+%Y%m%d_%H%M%S'`
bu=~/.dotfiles/backup/$dt
mkdir -p $bu

linker () {
  if [ -e "~/$1" ]; then
    cp -R "~/$1" $bu
  fi
  rm -rf "~/$1"
  ln -s "~/.dotfiles/$1" "~/$1"
}

linker .bashrc
linker .bash_profile
linker .gitconfig
linker .tmux.conf
linker .zshrc
