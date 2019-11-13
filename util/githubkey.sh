#!/usr/bin/bash

# key file location
keypath=~/.ssh/id_rsa

# generate key
ssh-keygen -t rsa -b 4096 -C "davide.bertolotto@gmail.com" $keypath
# start the agent and add the key
eval "$(ssh-agent -s)"
ssh-add $keypath
# show public key
cat $keypath.pub
