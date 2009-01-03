" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set textwidth=80

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd FileType perl setlocal makeprg=perl\ %

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " .vimrc has been edited, source it again
  autocmd BufWritePost ~/.vimrc   so ~/.vimrc

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set ignorecase
set guioptions-=T		"remove toolbar
"set guioptions-=m		"remove menubar

"needed for vim-latex
filetype plugin on
set grepprg=grep\ -nH\ $*
set winaltkeys=no

function PrintTimeHeader()
	let s:now = strftime("%a %b %d %Y %X")
	call append(line('.'), s:now)
	call cursor(line('.')+1, 0)
	call append(line('.'), repeat('=', len(s:now)))
	call cursor(line('.')+1, 0)
	call append(line('.'), "")
	call append(line('.'), "")
	call cursor(line('.')+2, 0)
	startinsert
endfunction

map <f2> :q <cr>
map <c-f2> :qa <cr>
nmap <f3> :sp $HOME/.vimrc <cr>
nmap <c-f3> :sp /home/ties/tmp/ciaranm/vimrc <cr>
nmap <f4> :w\|source $HOME/.vimrc <cr>
nmap <f6> :SpellSetLanguage nl <cr>
nmap <f7> :call PrintTimeHeader()<cr>
nmap <f8> :w\|call RunLaTeX() <cr>

imap <f2> <cr>\item 
imap <f5> Thijs Brobbel (0761401)
imap <f6> <C-o> :SpellSetLanguage nl <cr>

vmap <f5> c> [...]<esc>
vmap <esc>f c > [...] <esc>
nmap <f5> :w\|make<esc>
nmap <esc>f o> [...]<esc>

"let g:Tex_Com_fn = "\\footnote{<++>}<++>"
augroup MyIMAPs
	au!
	au VimEnter * call IMAP('EFN', '\footnote{<++>}<++>', '')
	au VimEnter * call IMAP('ASV', '\texttt{A.S.V.~Thonis}', '')
	au VimEnter * call IMAP('ftir', '\texttt{FTIR}', '')
	au VimEnter * call IMAP('soos', 'SooS', '')
"	au VimEnter * let g:Tex_PromptedCommands = g:Tex_PromptedCommands . ",ref"
augroup END

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


" nohighlight action
map <silent> ,h :nohl<CR>
map <silent> <F9> ,h
imap <silent> <F9> <C-O>,h
map ,. ,h

" logical Y action
map Y y$
