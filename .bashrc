#.bashrc: Ties' own bash startup

#TODO: make this more flexible (so you only have to comment out one line to
#	add, move or disable a script
[ -f ~/.bashrc.d/pre-startup ] && source ~/.bashrc.d/pre-startup
[ -f ~/.bashrc.d/screen ] && source ~/.bashrc.d/screen
[ -f ~/.bashrc.d/aliasen ] && source ~/.bashrc.d/aliasen
[ -f ~/.bashrc.d/functions ] && source ~/.bashrc.d/functions
[ -f ~/.bashrc.d/path ] && source ~/.bashrc.d/path
[ -f ~/.bashrc.d/bash ] && source ~/.bashrc.d/bash
[ -f ~/.bashrc.d/pager ] && source ~/.bashrc.d/pager
#[ -f ~/.bashrc.d/gentoo ] && source ~/.bashrc.d/gentoo
#[ -f ~/.bashrc.d/motd ] && source ~/.bashrc.d/motd
#[ -f ~/.bashrc.d/personal ] && source ~/.bashrc.d/personal
#[ -f ~/.bashrc.d/keychain ] && source ~/.bashrc.d/keychain
#[ -f ~/.bashrc.d/external/ciaranm ] && source ~/.bashrc.d/external/ciaranm