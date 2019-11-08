# link dotfiles
linker () {
  ln -s ~/.dotfiles/$1 ~/$1
}
linker .bashrc
linker .bash_profile
linker .tmux.conf
