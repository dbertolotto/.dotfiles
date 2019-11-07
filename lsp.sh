#!/usr/bin/bash

jdtpath=~/.vim/plugged/youcompleteme/third_party/ycmd/third_party/eclipse.jdt.ls/target/repository

config=config_linux

launcher=org.eclipse.equinox.launcher_1.5.500.v20190715-1310.jar

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
  -data ~/.javalsp \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED

