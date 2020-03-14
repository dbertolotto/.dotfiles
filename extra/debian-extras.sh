# install extra packages for debian
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
# vim
$apti vim vim-python-jedi
# emacs
$apti emacs
# go
$apti golang
# pil
$apti picolisp w3m
