#!/bin/bash
# installs virtualenv
set -e
cd "$(dirname $0)"
if [ -e "$HOME/.configuration" ]; then
    source "$HOME/.configuration"
else
    echo "$HOME/.configuration does not exit"
    exit 1
fi
if [ -e "$VIRTUALENV_HOME" ]
then
    mv "$VIRTUALENV_HOME" "$VIRTUALENV_HOME-$(date +%s).backup"
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
exit 0
