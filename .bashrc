# /etc/skel/.bashrc:

#TODO: get this working on all platforms, perhaps make it sense it's already
#	running within a screen and act on that (don't startup screen?, remap
#	shortcuts to new "shortcut-ring"?)
#TODO: perhaps put this in a subscript, if possible (but must be, since you
#	can source a script and call the potential function RunScreen()
if [[ $TERM != screen* ]] && [[ $- = *i* ]] ; then
#	exec screen -dRR
	echo "****screen temporarily disabled******"
fi

#TODO: maybe the following is necessary for reference when debugging on other
#platforms
	#[[ $TERM = screen || $- != *i* ]] || exec screen -RDD
	#[[ $TERM = screen || $- != *i* || -n $CYGWIN_ROOT ]] || exec screen -RDD

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

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if [[ -f ~/.dir_colors ]] ; then
	eval $(dircolors -b ~/.dir_colors)
elif [[ -f /etc/DIR_COLORS ]] ; then
	eval $(dircolors -b /etc/DIR_COLORS)
fi

#alias ls='ls --color=auto'
alias grep='grep --colour=auto'

# Change the window title of X terminals 
case ${TERM} in
	xterm*|rxvt*|Eterm|aterm|kterm|gnome)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

# extra config
#[ -f ~/.inputrc ] && INPUTRC="~/.inputrc"
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
# [ -f ~/dotfiles/bashrc.ciaranm ] && source ~/dotfiles/bashrc.ciaranm
[ -f ~/.bash-aliasen ] && source ~/.bash-aliasen
[ -f ~/.bash-functions ] && source ~/.bash-functions
[ -f ~/.bash-gentoo ] && source ~/.bash-gentoo

# keychain stuff
[ -f ~/.keychain/${HOSTNAME}-sh ] && source ~/.keychain/${HOSTNAME}-sh
[ -f ~/.keychain/${HOSTNAME}-sh-gpg ] && source ~/.keychain/${HOSTNAME}-sh-gpg

#path stuff
#export PATH="~/bin:$PATH:/usr/sbin:/sbin"
#export CDPATH=.:~:~/docs:~/src:~/src/ops/docs:
#	/mnt:/usr/src/redhat:/usr/src/redhat/RPMS:/usr/src:/usr/lib:/usr/local:/software:/software/redhat
export PATH="~/bin:$PATH"
export CDPATH=".:~:/usr:/usr/portage:~/media"

# macport stuff
export PATH="/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin:/usr/X11/bin:$PATH"
#export DISPLAY=:0.0

#set history
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:ll:mutt:[bf]g:fc:history *:exit:eb:ei"
export HISTSIZE=2000
unset HISTFILESIZE
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
HISTTIMEFORMAT="%d %b %R "
shopt -s histappend
shopt -s histverify

#shell options
shopt -s cdspell

# program options
if [[ -f /usr/bin/less ]] ; then
    export PAGER=less
    export LESS="--ignore-case --long-prompt"
fi
if [[ -f /usr/bin/vimpager ]] ; then
    export PAGER=vimpager
    export MANPAGER=vimmanpager
elif [[ -f /usr/share/vim/vim63/macros/less.sh ]] ; then
    export PAGER="/usr/share/vim/vim63/macros/less.sh"
elif [[ -f /usr/share/vim/vim70aa/macros/less.sh ]] ; then
    export PAGER="/usr/share/vim/vim70aa/macros/less.sh"
fi
if [[ -f /usr/bin/bc ]] ; then
	export BC_ENV_ARGS=" -q"
fi

export PYTHONSTARTUP="/home/ties/.python"

export MAILHOST='xs4all.nl'
export MAILUSER='tieze'

# set papersize to A4
#export LANG="nl_NL@euro.UTF-8"
export LANG="nl_NL.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

export NNTPSERVER='borft.student.utwente.nl'

# motd
fortune -e -a -s gentoo-dev gentoo-forums


PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export PERLLIB="/opt/local/lib/perl5/site_perl/5.8.8/"
