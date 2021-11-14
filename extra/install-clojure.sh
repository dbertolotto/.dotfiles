version="1.10.3.1029"
install_dir="${PREFIX}"

curl -O https://download.clojure.org/install/linux-install-$version.sh
chmod +x linux-install-$version.sh
./linux-install-$version.sh --prefix $install_dirrm linux-install-$version.sh
