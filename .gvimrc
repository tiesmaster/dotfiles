" Include user's local vim config
if filereadable(expand("~/.vim/gvimrc"))
  source ~/.vim/gvimrc
endif

" I need my windows maximized
if has("gui_win32")
	au GUIEnter * simalt ~x
endif
