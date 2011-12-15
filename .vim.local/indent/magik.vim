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
setlocal noet
setlocal ts=4 sts=4 sw=4
setlocal tw=80

setlocal comments+=b:##

set tags+=~/tmp/rw/bag/bag.runtime/munit/tags,~/tmp/rw/smallworld/tags

let b:undo_indent = "setl ai< si<"

iabbrev <buffer> true      _true
iabbrev <buffer> false      _false
" iabbrev <buffer> clone      _clone
" iabbrev <buffer> self       _self
" iabbrev <buffer> super      _super
" iabbrev <buffer> thisthread _thisthread
" iabbrev <buffer> try        _try
" iabbrev <buffer> catch      _catch
" iabbrev <buffer> throw      _throw
" iabbrev <buffer> when       _when
" iabbrev <buffer> endcatch   _endcatch
" iabbrev <buffer> protect    _protect
" iabbrev <buffer> protection _protection
" iabbrev <buffer> endprotect _endprotect
" iabbrev <buffer> handing    _handing
" iabbrev <buffer> with       _with
" iabbrev <buffer> finally    _finally
" iabbrev <buffer> global     _global
" iabbrev <buffer> local      _local
" iabbrev <buffer> private    _private
" iabbrev <buffer> constant   _constant
" iabbrev <buffer> dynamic    _dynamic
" iabbrev <buffer> optional   _optional
" iabbrev <buffer> scatter    _scatter
" iabbrev <buffer> gather     _gather
" iabbrev <buffer> method     _method
" iabbrev <buffer> endmethod  _endmethod
" iabbrev <buffer> proc       _proc
" iabbrev <buffer> endproc    _endproc
" iabbrev <buffer> block      _block
" iabbrev <buffer> endblock   _endblock
" iabbrev <buffer> for        _for
" iabbrev <buffer> loop       _loop
" iabbrev <buffer> loopbody   _loopbody
" iabbrev <buffer> over       _over
" iabbrev <buffer> continue   _continue
" iabbrev <buffer> leave      _leave
" iabbrev <buffer> iter       _iter
" iabbrev <buffer> endloop    _endloop
" iabbrev <buffer> return     _return
" iabbrev <buffer> if         _if
" iabbrev <buffer> then       _then
" iabbrev <buffer> elif       _elif
" iabbrev <buffer> else       _else
" iabbrev <buffer> endif      _endif
" iabbrev <buffer> not        _not
" iabbrev <buffer> is         _is
" iabbrev <buffer> isnt       _isnt
" iabbrev <buffer> unset      _unset
" iabbrev <buffer> and        _and
" iabbrev <buffer> andif      _andif
" iabbrev <buffer> or         _or
" iabbrev <buffer> orif       _orif
" iabbrev <buffer> cf         _cf
" iabbrev <buffer> eq         _eq
" iabbrev <buffer> package    _package
" iabbrev <buffer> import     _import
