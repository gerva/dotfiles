#!/bin/bash

set -e

cd "$(dirname $0)"
source configuration

function create_link {
    local SRC="${PWD}/$1"
    local DST="$2"

    if [ -e "${DST}" ] && [ ! -L "${DST}" ]; then
        mv $DST $DST.df.bak
    fi

    ln -sf ${SRC} ${DST}
}

echo "* creating symlinks"
create_link configuration "$HOME/.configuration"
create_link _bashrc "$HOME/.bashrc"


echo "* creating virtualenv"
./create_virtualenvs.sh

