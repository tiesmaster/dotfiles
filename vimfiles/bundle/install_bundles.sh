#!/bin/bash

function install_bundle() {
    BUNDLE_URL=$1
    git clone $BUNDLE_URL
}

install_bundle git@github.com:tpope/vim-sensible.git
install_bundle git@github.com:tpope/vim-unimpaired.git

# vim-colors-solarized
# nerdcommenter
# ctrlp.vim
# gundo.vim
# vim-fugitive
# vim-dispatch
# vim-surround
