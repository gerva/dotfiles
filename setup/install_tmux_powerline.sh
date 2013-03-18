#!/bin/bash
# installs tmux
cd "$(dirname "$0")"

set -e
if [ -e "$HOME/.configuration" ]; then
    source "$HOME/.configuration"
else
    echo "$HOME/.configuration does not exit"
    exit 1
fi

if [ ! -e "$POWERLINE_DIR" ]
then
    mkdir -p "$BASE_GIR_DIRS"
    cd "$BASE_GIR_DIRS"
    git clone git@github.com:erikw/tmux-powerline.git "$POWERLINE_DIR" > /dev/null 2>&1
fi
exit 0
