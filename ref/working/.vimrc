let mapleader = ","

" these has been disabled to facilitate moving them to the appropriate filetype plugins
"set autoindent
"set textwidth=120
"set tabstop=4
"set shiftwidth=4

nmap <f3> :tabedit $HOME/.vimrc<cr>
nmap <f5> :tabedit $HOME/Dropbox/todo/todo<cr>
nmap <f6> :tabedit $HOME/Dropbox/todo/todo-work<cr>
nmap <f7> :tabedit $HOME/Dropbox/todo/todo-delta<cr>
nmap <f8> :tabedit $HOME/Dropbox/todo/brainstorm-IT<cr>

" map Y to behave like it's counterparts (C, D, etc.), see the VIM docs for
" more info (type :h Y)
map Y y$

" TextMate simulated keystroke's for shifting width with a single keystroke
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" janus insprired options

" Directories for swp files
if isdirectory(expand("~/.vim/backup"))
	set backupdir=~/.vim/backup
endif

if exists("macvim_hig_shift_movement")
	unlet macvim_hig_shift_movement
endif

au BufWritePost *.snippets		call ReloadAllSnippets()

" vim:filetype=vim
