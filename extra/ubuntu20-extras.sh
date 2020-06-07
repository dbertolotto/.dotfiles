# install extra packages for debian
apti='apt install -y --no-install-recommends'

apt update -y && apt upgrade -y

# utility packages
$apti bash-completion fzf
# necessary for youcompleteme (vim plugin)
$apti build-essential cmake python3-dev
# java
$apti openjdk-11-jdk-headless openjdk-11-jdk openjdk-11-jre-headless openjdk-11-jre openjdk-11-source
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
