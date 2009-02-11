if has("gui_win32")
	au GUIEnter * simalt ~x
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
