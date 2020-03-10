# install emulation station
apti='apt install -y --no-install-recommends'
build_dir='~/.dotfiles/tmp/EmulationStation'
version='master'

apt update -y && apt upgrade -y

# dependencies
$apti libsdl2-dev libboost-system-dev libboost-filesystem-dev libboost-date-time-dev libboost-locale-dev libfreeimage-dev libfreetype6-dev libeigen3-dev libcurl4-openssl-dev libasound2-dev libgl1-mesa-dev build-essential cmake git
# clone repo
git clone https://github.com/Aloshi/EmulationStation $build_dir
cd $build_dir
git checkout $version
# build
cmake .
make
make install
cd ~/.dotfiles

