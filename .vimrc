" Custom .vimrc file of Thijs Brobbel

set runtimepath+=~/.vim.local
let mapleader = ","

" Include user's local vim config
if filereadable(expand("~/.vim/vimrc"))
  source ~/.vim/vimrc
endif

" fix missing the .vim dir on the runtime PATH on Windows
if has("win32")
	set runtimepath+=~/.vim
endif

runtime vimrc_example.vim

" nice options, don't want to live without it ;)
set ignorecase
set diffopt+=iwhite
" FIXME: make this working on win32
if !has("win32")
	set listchars=tab:▸·,trail:·
else
	set listchars=tab:\ \ 
endif

" these has been disabled to facilitate moving them to the appropriate filetype plugins
"set autoindent
"set textwidth=120
"set tabstop=4
"set shiftwidth=4

" nice statusbar
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
if filereadable(expand("$HOME/.vim/plugin/fugitive.vim"))
	set statusline+=%{fugitive#statusline()}     " git branch}
endif
set statusline+=%=                           " right align
set statusline+=0x%-8B\                      " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

nmap <f3> :tabedit $HOME/.vimrc<cr>
nmap <f5> :tabedit $HOME/Dropbox/Documents/todo/todo<cr>
nmap <f6> :tabedit $HOME/Dropbox/Documents/todo/todo-work<cr>
nmap <f7> :tabedit $HOME/Dropbox/Documents/todo/todo-bag<cr>
nmap <f8> :tabedit $HOME/Dropbox/Documents/todo/brainstorm-IT<cr>

" map Y to behave like it's counterparts (C, D, etc.), see the VIM docs for
" more info (type :h Y)
map Y y$

" TextMate simulated keystroke's for shifting width with a single keystroke
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

map <f4> :%!xmllint --format --recover - <cr>

" clipboard shortcuts
" F9 : cut
" F11: copy
" F12: paste
" NOTE: using F9 instead of F10, since F10 is menubar
vmap <f9> "+x
vmap <f11> "+y

nmap <f12> "+gP
imap <f12> +
cmap <f12> +
vmap <f12> "+p

" temporarily shortcut to open the course file for VIM
" FIXME: refactor this to set a variable and set the keymap using that one
if filereadable(expand("$HOME/Dropbox/course_vim.txt"))
	map <s-f1> :sp $HOME/Dropbox/course_vim.txt <cr>
else
	map <s-f1> :sp c:/worksource/Ties/Dropbox/course_vim.txt <cr>
endif
map <f2> :h quickref<cr>

" janus insprired options

" Directories for swp files
if isdirectory(expand("~/.vim/backup"))
	set backupdir=~/.vim/backup
endif

set number
set ruler

set cursorline
if exists("macvim_hig_shift_movement")
	unlet macvim_hig_shift_movement
endif

au BufWritePost *.snippets		call ReloadAllSnippets()

" vim:filetype=vim
