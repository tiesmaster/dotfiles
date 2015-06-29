#!/bin/bash

git clone https://github.com/tiesmaster/dotfiles.git
cd dotfiles

setx HOME `pwd`
export HOME=`pwd`

ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''
cat ~/.ssh/id_rsa.pub |clip

echo "The generated key has been copied to the clibboard."
echo "Add it to your SSH keys @ https://github.com/settings/ssh"
echo "to make sure installing the VIM bundles will work."

~/vimfiles/bundle/install_bundles.sh
git remote set-url origin git@github.com:tiesmaster/dotfiles.git
