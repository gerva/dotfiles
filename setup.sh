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
create_link _autocomplete.bash
create_link _git-completion.bash
create_link _bashrc
create_link _gitconfig
create_link _alias
create_link _prompt
create_link _profile
create_link _tmux.conf
create_link _tmux-powerlinerc
create_link _hgrc
create_link _hgignore

function brewInstall() {
    name="$1"
    which "$name" > /dev/null 2>&1
    if [ "$?" != '0' ]
    then
        echo "* installing $name"
        brew install "$name" >/dev/null 2>&1
    fi
}

which virtualenv > /dev/null
if [ "$?" != "0" ]
then
    echo "* creating virtualenv"
    setup/create_virtualenvs.sh
fi

which brew > /dev/null
if [ "$?" != "0" ]
then
    echo "* installing brew"
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)" > /dev/null 2>&1
fi
brewInstall wget
brewInstall tmux

# stuff from github
echo "* installing tmux-powerline"
setup/install_tmux_powerline.sh
exit 0
