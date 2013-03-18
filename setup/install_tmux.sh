#!/bin/bash
# installs tmux
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
echo "* downloading tmux (v $TMUX_VERSION)"
curl --silent --output "tmux-for-iTerm2-$TMUX_VERSION.tar.gz" --location https://iterm2.googlecode.com/files/tmux-for-iTerm2-"$TMUX_VERSION".tar.gz 
tar xzf "tmux-for-iTerm2-$TMUX_VERSION.tar.gz"
echo "* installing tmux"
cd "tmux"
echo "* configuring tmux"
sh autogen.sh > /dev/null 2>&1
./configure CFLAGS="-I$LIBEVENT_DIR/include" LDFLAGS="-L$LIBEVENT_DIR/lib" > /dev/null 2>&1
make
cd /
rm -rf "$TEMP_DIR"

