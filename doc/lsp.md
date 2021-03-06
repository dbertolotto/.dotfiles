# LSP Setup

## Python

### Install
```bash
pip install 'python-language-server[all]'
```

### Run
```bash
pyls
```

## Go

### Install
```bash
GO111MODULE=on go get golang.org/x/tools/gopls@latest
```

### Run
```bash
gopls serve
```

## Java

### Install
Download the latest language server from `https://download.eclipse.org/jdtls/milestones/?d`, e.g.
```bash
wget http://download.eclipse.org/jdtls/milestones/0.55.0/jdt-language-server-0.55.0-202004300028.tar.gz
```
and uncompress it with
```bash
tar -C ~/.ejdtls -zxf jdt-language-server-0.55.0-202004300028.tar.gz
```
There will be several `config_*` folders and a plugin folder with many jars.

### Run
For JDK 9+
```bash
#!/usr/bin/bash

# Directory where the language server was uncompressed
jdtpath=~/.ejdtls

# Set here the right config for your system
config=config_linux

# Name of the launcher file
launcher=org.eclipse.equinox.launcher_1.5.700.v20200207-2156.jar

# Directory where server data will be stored
datapath=~/.javalsp

java \
  -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044 \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.level=ALL \
  -noverify \
  -Xmx1G \
  -jar $jdtpath/plugins/$launcher \
  -configuration $jdtpath/$config \
  -data $datapath \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED

```
This can be put in a bash script for easy usage.
See https://github.com/eclipse/eclipse.jdt.ls for more details.
