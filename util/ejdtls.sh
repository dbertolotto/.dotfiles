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

