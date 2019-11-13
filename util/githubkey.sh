#!/usr/bin/bash

ssh-keygen -t rsa -b 4096 -C "davide.bertolotto@gmail.com" -f ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
