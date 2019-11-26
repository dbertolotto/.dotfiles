# install extra packages for debian
apti='apt install -y --no-install-recommends'

apt update -y && apt upgrade -y

# utility packages
$apti bash-completion
# necessary for youcompleteme (vim plugin)
$apti build-essential cmake python3-dev
# jdk
$apti default-jdk default-jre
# vim & emacs
$apti vim vim-python-jedi emacs
