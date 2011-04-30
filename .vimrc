" Custom .vimrc file of Thijs Brobbel

" fix missing the .vim dir on the runtime PATH on Windows
if has("win32")
	set runtimepath+=~/.vim
endif

runtime vimrc_example.vim

" nice options, don't want to live without it ;)
set ignorecase
set diffopt+=iwhite
if !has("win32")
	" Use the same symbols as TextMate for tabstops and EOLs
	set listchars=tab:▸\ ,eol:¬
	"Invisible character colors
	highlight NonText guifg=#7a7a79
	highlight SpecialKey guifg=#7a7a79
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
set statusline+=%{fugitive#statusline()}     " git branch}
if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
	set statusline+=\ %{VimBuddy()}          " vim buddy
endif
set statusline+=%=                           " right align
set statusline+=0x%-8B\                      " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

nmap <f3> :sp $HOME/.vimrc <cr>

" map Y to behave like it's counterparts (C, D, etc.), see the VIM docs for
" more info (type :h Y)
map Y y$

" TextMate simulated keystroke's for shifting width with a single keystroke
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

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
map <s-f1> :e $HOME/Dropbox/course_vim.txt <cr>

" janus insprired options

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" vim:filetype=vim
