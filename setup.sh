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
linker .fzf.bash
linker .gitconfig
linker .inputrc
linker .termux
linker .tmux.conf
linker .vim
linker .emacs.d
linker bin
linker .config/nvim

echo "Done!"
echo "Backed up files are in $bu"
