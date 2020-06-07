#!/usr/bin/bash

# Directory where the language server was uncompressed
jdtpath=~/.ejdtls

# Set here the right config for your system
config=config_linux

# Name of the launcher file
launcher=`ls $jdtpath/plugins/org.eclipse.equinox.launcher_*.jar`

java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.level=ALL \
  -noverify \
  -Xmx1G \
  -jar $launcher \
  -configuration $jdtpath/$config \
  -data $jdtpath/data \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED

# this may be needed for remote debugging the server
#-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044 \

# this may be needed for lombok
#  -javaagent:$jdtpath/lombok.jar \
#  -Xbootclasspath/a:$jdtpath/lombok.jar \
