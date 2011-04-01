source $VIMRUNTIME/vimrc_example.vim

" vim:filetype=vim
" Custom .vimrc file, Thijs Brobbel
if has("win32")
	set runtimepath+=~/.vim
endif

set textwidth=120
set autoindent		" always set autoindenting on
set ignorecase
set tabstop=4
set shiftwidth=4
set diffopt+=iwhite

  " Some makeprg's
  autocmd FileType perl setlocal makeprg=perl\ %
  autocmd FileType xslt setlocal makeprg=java\ -jar\ d:\\ties\\bin\\jar\\xalan.jar\ -XSL\ %\ -in\ %<_input.xml\ -out\ %<_output.xml
  autocmd FileType xslt set autowrite

" *** .vimrc.d/settings end

" *** .vimrc.d/statusbar start
" 'stolen' from ciaranm
	" Nice statusbar
	set laststatus=2
	set statusline=
	set statusline+=%-3.3n\                      " buffer number
	set statusline+=%f\                          " file name
	set statusline+=%h%m%r%w                     " flags
	set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
	set statusline+=%{&encoding},                " encoding
	set statusline+=%{&fileformat}]              " file format
	if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
	    set statusline+=\ %{VimBuddy()}          " vim buddy
	endif
	set statusline+=%=                           " right align
	set statusline+=0x%-8B\                      " current char
	set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" vim:filetype=vim
" *** .vimrc.d/statusbar end

" *** .vimrc.d/keymap start
" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

map <c-f2> :qa <cr>
map <f4> :q <cr>

" VIMRC stuff
"nmap <c-f3> :sp /home/ties/tmp/ciaranm/vimrc <cr>
" TODO: move to a seperate fileplugin script
nmap <f3> :sp $HOME/.vimrc <cr>
nmap <f4> :w\|source $HOME/.vimrc <cr>

vmap <f5> c> [...]<esc>
vmap <esc>f c > [...] <esc>
nmap <esc>f o> [...]<esc>

" nohighlight action
"map <silent> ,h :nohl<CR>
"map <silent> <F9> ,h
"imap <silent> <F9> <C-O>,h
"map ,. ,h

" logical Y action
map Y y$

" clipboard shortcuts, using F9 instead of F10, since F10 is menubar
vmap <f9> "+x
vmap <f11> "+y

nmap <f12> "+gP
imap <f12> +
cmap <f12> +
vmap <f12> "+p

" vim:filetype=vim 
" *** .vimrc.d/keymap end

" *** .vimrc.d/course_vim start
" .vimrc.d/course_vim: temporarily shortcut to open the course file for VIM

map <s-f1> :e $HOME/Dropbox/course_vim.txt <cr>

" vim:filetype=vim
" *** .vimrc.d/course_vim end
