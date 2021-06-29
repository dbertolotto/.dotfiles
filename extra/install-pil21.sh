#!/usr/bin/env bash

apt install make clang llvm readline libffi openssl pkg-config
curl -Os https://software-lab.de/pil21.tgz
tar xfz pil21.tgz
cd pil21
(cd src; make)
