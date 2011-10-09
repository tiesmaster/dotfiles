" Vim indent file
" Language:	GE Smallworld MagikSF
" Maintainer:    Thijs Brobbel <thijsbrobbel@gmail.com>
" URL:		 http://github.com/tiesmaster/dotfiles
" Last Change:	2011 April 15

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

setlocal ai nosi

let b:undo_indent = "setl ai< si<"
