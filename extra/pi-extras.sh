# install extra packages for raspberry pi
apti='apt install -y --no-install-recommends'

apt update -y && apt upgrade -y

# utility packages
$apti bash-completion fzf
# necessary for youcompleteme (vim plugin)
$apti build-essential cmake python3-dev
# java
$apti default-jdk default-jre
# clojure
$apti clojure leiningen
# vim & emacs
$apti vim vim-python-jedi emacs
# go
$apti golang
# node
$apti nodejs yarn
# pil
$apti picolisp
# gnome
$apti gnome
