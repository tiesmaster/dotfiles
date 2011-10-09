" Include user's local vim config
if filereadable(expand("~/.vim/gvimrc"))
  source ~/.vim/gvimrc
endif

" I need my windows maximized
if has("gui_win32")
	au GUIEnter * simalt ~x
endif

" highlight the current line with clear color
hi CursorLine guibg=darkred

" make the search fall out
hi Search guibg=yellow
