#.bashrc: Ties' own bash startup

# make sure .bashrc doesn't produce any output if non-interactive
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

[ -f ~/.bashrc.d/aliasen ] && source ~/.bashrc.d/aliasen
[ -f ~/.bashrc.d/functions ] && source ~/.bashrc.d/functions
[ -f ~/.bashrc.d/bash ] && source ~/.bashrc.d/bash
[ -f ~/.bashrc.d/pager ] && source ~/.bashrc.d/pager
[ -f ~/.bashrc.d/environment-vars ] && source ~/.bashrc.d/environment-vars

[ -f ~/.bashrc.d/git-completion ] && source ~/.bashrc.d/git-completion

export DOTFILES_RUN=true
export PATH=/usr/local/bin:${PATH}
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

echo "**************************************************************************"
echo "* Welkom to dotfiles version `git --git-dir=${HOME}/.git describe`"
echo "* Don't forget to update your version on a regular basis, eg: $ git pull *"
echo "**************************************************************************"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

if [[ $OSTYPE == "msys" ]]; then
	export EDITOR="gvim -f"
else
	export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
fi

CDPATH=$CDPATH:~/Documents
CDPATH=$CDPATH:~/Documents/src/rw
CDPATH=$CDPATH:~/Documents/worksource/rw/stedin
CDPATH=$CDPATH:~/Documents/worksource/rw/stedin/src
export CDPATH

alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
