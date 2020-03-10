# install emulation station
apti='apt install -y --no-install-recommends'
build_dir="~/.dotfiles/tmp/mame"
version='mame0219'
multi=5

apt update -y && apt upgrade -y

# dependencies
$apti git build-essential python libsdl2-dev libsdl2-ttf-dev libfontconfig-dev qt5-default
# clone repo
git clone https://github.com/mamedev/mame.git $build_dir
cd $build_dir
git checkout $version
# build
make TOOLS=1 REGENIE=1 -j$multi
cd ~/.dotfiles

