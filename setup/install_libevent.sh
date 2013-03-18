#!/bin/bash
# installs libevent
cd "$(dirname "$0")"

set -e
cd "$(dirname $0)"
if [ -e "$HOME/.configuration" ]; then
    source "$HOME/.configuration"
else
    echo "$HOME/.configuration does not exit"
    exit 1
fi

TEMP_DIR="$(mktemp -d -t XXXXXXXXXX)"
cd "$TEMP_DIR"
echo "* downloading libevent (v $LIBEVENT_VERSION)"
curl --silent --output "libevent-$LIBEVENT_VERSION-stable.tar.gz" --location  https://github.com/downloads/libevent/libevent/libevent-"$LIBEVENT_VERSION"-stable.tar.gz
tar xzf "libevent-$LIBEVENT_VERSION-stable.tar.gz"
echo "* installing libevent"
cd "libevent-$LIBEVENT_VERSION-stable"
echo "* configuring libevent"
./configure --prefix=/opt > /dev/null 2>&1
echo "* make libevent" 
make > /dev/null 2>&1
echo "* make install libevent"
make install > /dev/null 2>&1
cd /
rm -rf "$TEMP_DIR"

