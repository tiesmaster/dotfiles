" Custom .vimrc file, Thijs Brobbel

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

source ~/.vimrc.d/keymap
source ~/.vimrc.d/settings
source ~/.vimrc.d/statusbar
source ~/.vimrc.d/course_vim
