#!/bin/bash

set -e

cd "$(dirname $0)"
source _configuration

function create_link {
    local SRC="${PWD}/$1"
    local DST="${HOME}/${1/_/.}"

    if [ -e "${DST}" ] && [ ! -L "${DST}" ]; then
        mv $DST $DST.df.bak
    fi

    ln -sf ${SRC} ${DST}
}

echo "* creating symlinks"
create_link _configuration
create link _autocomplete
create link _git-completion.bash
create_link _bashrc
create_link _gitconfig
create_link _alias
create_link _prompt


echo "* creating virtualenv"
./create_virtualenvs.sh

