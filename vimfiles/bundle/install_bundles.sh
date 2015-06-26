#!/bin/bash

function install_bundle() {
    BUNDLE_URL=$1
    BUNDLE_DIR=`basename $BUNDLE_URL .git`
    [ ! -d $BUNDLE_DIR ] && git clone $BUNDLE_URL
}

install_bundle git@github.com:tpope/vim-sensible.git
install_bundle git@github.com:tpope/vim-unimpaired.git
install_bundle git@github.com:altercation/vim-colors-solarized.git
install_bundle git@github.com:scrooloose/nerdcommenter.git
install_bundle git@github.com:kien/ctrlp.vim.git

# gundo.vim
# vim-fugitive
# vim-dispatch
# vim-surround
