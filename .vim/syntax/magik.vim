" Vim syntax file
" Language:	Magik
" Maintainer:	Thijs Brobbel <thijsbrobbel@gmail.com>
" Updated:	2010-12-10
"		Inception

if exists("b:current_syntax")
  finish
endif

" enable ! and ? as valid identifier characters
setlocal iskeyword+=!,63

syn keyword magikStatement	_clone _self _super
syn keyword magikStatement	_thisthread
syn keyword magikStatement	_try _catch _throw _when _endcatch
syn keyword magikStatement	_protect _protection _endprotect
syn keyword magikStatement	_handing _with _finally
syn keyword magikStatement	_global _local _private _constant _dynamic _optional
syn keyword magikStatement	_scatter _gather
syn keyword magikStatement	_method _endmethod _proc _endproc _block _endblock
syn match   magikIdentifier	"\k*" 
syn keyword magikRepeat		_for _loop _loopbody _over _continue _leave _iter _endloop _return
syn keyword magikConditional	_if _then _elif _else _endif
syn keyword magikOperator	_not _is[nt] _unset _and[if] _or[if] _cf _eq
syn keyword magikPreCondit	_package _import
syn match   magikComment	"#.*$" contains=magikTodo,magikSymbol
syn keyword magikTodo		TODO FIXME XXX contained

syn match   magikSymbol		":\k*"
syn keyword magikBool		_true _false _maybe
syn keyword magikPrama		_pragma classify_level topic usage
syn region  magikString		start=\"\ end=\"\
syn match   magikSpecialComment	"##.*$" contains=magikCommentTag,magikSymbol
syn match   magikSpecialComment	"#%.*$"
syn match   magikSpecialComment	"#&&$"
syn match   magikLabel		"@\k*"
syn keyword magikType		rope
syn keyword magikDef		def_slotted_exemplar define_slot_access define_pseudo_slot
syn keyword magikCommentTag	File Copyright contained
syn match   magikCommentTag	/Contains/ contained
syn match   magikCommentTag	/Date\s\w*/ contained
syn keyword magikCommentTagCode	Function Methodology Parameters Returns Revision Purpose Usage contained
syn match   magikChar		/%\k*/

command -nargs=+ HiLink hi def link <args>
HiLink magikStatement		Statement
HiLink magikIdentifier		Function
HiLink magikConditional		Conditional
HiLink magikRepeat		Repeat
HiLink magikString		String
HiLink magikOperator		Operator
HiLink magikPreCondit		PreCondit
HiLink magikComment		Comment
HiLink magikTodo		Todo
HiLink magikPrama		Define
HiLink magikNumber		Number
HiLink magikBuiltin		Function
HiLink magikException		Exception
HiLink magikSpaceError		Error

HiLink magikSymbol		Special
HiLink magikBool		Boolean
HiLink magikSpecialComment	SpecialComment
HiLink magikLabel		Label
HiLink magikType		Type
HiLink magikDef			Typedef
HiLink magikCommentTag		Underlined
HiLink magikCommentTagCode	Underlined
HiLink magikChar		Character

let b:current_syntax = "magik"
finish
