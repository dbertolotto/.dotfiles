#!/usr/bin/bash

# key file location
keyfile=~/.ssh/id_github

# generate key
ssh-keygen -t rsa -b 4096 -C "davide.bertolotto@gmail.com" -f $keyfile
# start the agent and add the key
eval "$(ssh-agent -s)"
ssh-add $keyfile
# show public key
cat $keyfile.pub
