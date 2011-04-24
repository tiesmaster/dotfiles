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

echo "**************************************************************************"
echo "* Welkom to dotfiles version `git describe`"
echo "* Don't forget to update your version on a regular basis, eg: $ git pull *"
echo "**************************************************************************"

export DOTFILES_RUN=true
