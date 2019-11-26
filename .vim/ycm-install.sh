# custom YCM install script

if command -v python3; then
	PYT_EXE=python3
elif command -v python; then
	PYT_EXE=python
else
	echo "Python not found; skipping YCM installation"
	return
fi

OPTS=
if command -v java; then
	echo "Java found!"
	OPTS="$OPTS --java-completer"
fi
if command -v go; then
  echo "Go found!"
	OPTS="$OPTS --go-completer"
fi

CDIR=`pwd`
cd ~/.vim/plugged/youcompleteme
$PYT_EXE install.py $OPTS
cd $CDIR
echo "YCM installation finished"
