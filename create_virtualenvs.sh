#!/bin/bash
# installs virtualenv
set -e
cd "$(dirname $0)"
source configuration
if [ -e "$VIRTUALENV_HOME" ]
then
    mv "$VIRTUALENV_HOME-$(date).backup"
fi
mkdir -p "$VIRTUALENV_HOME"
TEMP_DIR="$(mktemp -d -t XXXXXXXXXX)"
cd "$TEMP_DIR"
echo "* downloading virtualenv (v $VIRTUALENV_VERSION)"
wget -q -O virtualenv.tar.gz http://pypi.python.org/packages/source/v/virtualenv/virtualenv-$VIRTUALENV_VERSION.tar.gz
echo "* unpacking virtualenv"
tar xzf virtualenv.tar.gz
echo "* installing virtualenv"
/usr/bin/python "virtualenv-$VIRTUALENV_VERSION/virtualenv.py" "$VIRTUALENV_HOME"
"$VIRTUALENV_HOME/bin/pip" install virtualenvwrapper
cd /
rm -rf "$TEMP_DIR"
cat >> $HOME/.bashrc << EOF 

#Added by $0 on $(date)
export WORKON_HOME="$HOME/.virtualenvs"
export VIRUTALENVWRAPPER_PYTHON="$HOME/venv/bin/python"
source "$HOME/venv/bin/virtualenvwrapper.sh"
export PATH=$PATH:$HOME/venv/bin
EOF
exit 0
