" Custom .vimrc file, Thijs Brobbel

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

source ~/.vimrc.d/keymap
source ~/.vimrc.d/settings
source ~/.vimrc.d/statusbar
" source ~\.vimrc.d\vimlatex
"TODO: fix defining a function and having the possibility to re-source it using
"	F4
"source ~\.vimrc.d\functions
