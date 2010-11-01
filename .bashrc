#.bashrc: Ties' own bash startup
# $Id$

# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

#TODO: make this more flexible (so you only have to comment out one line to
#	add, move or disable a script

#echo "****screen temporarily disabled******"
[ -f ~/.bashrc.d/screen ] && source ~/.bashrc.d/screen
[ -f ~/.bashrc.d/aliasen ] && source ~/.bashrc.d/aliasen
[ -f ~/.bashrc.d/functions ] && source ~/.bashrc.d/functions
[ -f ~/.bashrc.d/path ] && source ~/.bashrc.d/path
[ -f ~/.bashrc.d/bash ] && source ~/.bashrc.d/bash
[ -f ~/.bashrc.d/pager ] && source ~/.bashrc.d/pager
[ -f ~/.bashrc.d/environment-vars ] && source ~/.bashrc.d/environment-vars
[ -f ~/.bashrc.d/git-completion ] && source ~/.bashrc.d/git-completion
#[ -f ~/.bashrc.d/gentoo ] && source ~/.bashrc.d/gentoo
#[ -f ~/.bashrc.d/motd ] && source ~/.bashrc.d/motd
#[ -f ~/.bashrc.d/personal ] && source ~/.bashrc.d/personal
#[ -f ~/.bashrc.d/keychain ] && source ~/.bashrc.d/keychain
#[ -f ~/.bashrc.d/external/ciaranm ] && source ~/.bashrc.d/external/ciaranm

#FIXME: following include needs to get merged with normal infrastructure
[ -f ~/.profile ] && source ~/.profile

echo '***'
echo 'Welkom to dotfiles version 0.1 ($Revision$)'
echo "Don't forget to update your version on a regular basis, eg: $ svn update"
echo '***'
