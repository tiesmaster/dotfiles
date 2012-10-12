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
syn keyword magikStatement	_try _catch _throw _when _endcatch _endtry
syn keyword magikStatement	_protect _protection _endprotect
syn keyword magikStatement	_lock _endlock _locking
syn keyword magikStatement	_handling _with _finally
syn keyword magikStatement	_global _local _private _abstract _constant _dynamic _optional
syn keyword magikStatement	_scatter _gather _allresults
syn keyword magikStatement	_method _endmethod _proc _endproc _block _endblock
syn match   magikIdentifier	"\k*" 
syn keyword magikRepeat		_for _loop _loopbody _over _continue _leave _iter _endloop _return
syn keyword magikConditional	_if _then _elif _else _endif
syn keyword magikOperator	_not _is[nt] _unset _and[if] _or[if] _xor _cf _eq
syn keyword magikOperator	_div _mod
syn keyword magikPreCondit	_package _import
syn match   magikComment	"#.*$" contains=magikTodo,magikSymbol
syn keyword magikTodo		TODO[:] FIXME[:] XXX[:] contained

syn match   magikSymbol		":\k*"
syn keyword magikBool		_true _false _maybe
syn keyword magikPrama		_pragma classify_level topic usage
syn region  magikString		start=\"\ end=\"\
syn match   magikSpecialComment	"##.*$" contains=magikCommentTag,magikSymbol
syn match   magikSpecialComment	"#%.*$"
syn match   magikSpecialComment	"#&&$"
syn match   magikLabel		"@\k*"
syn keyword magikType		rope simple_vector property_list
syn keyword magikType		hash_table weak_hash_table equality_hash_table
syn keyword magikType		set weak_set equality_set
syn keyword magikType		condition
syn keyword magikDef		def_package def_slotted_exemplar def_indexed_exemplar def_mixin def_enumeration
syn keyword magikDef		define_slot_access define_pseudo_slot
syn keyword magikDef		define_shared_constant define_shared_variable
syn keyword magikDef		define_method define_method_synonym
" syn keyword magikDef		define_condition	<=== not useful, since condition is also highlighted the same
syn keyword magikCommentTag	File Copyright contained
syn match   magikCommentTag	/Contains/ contained
syn match   magikCommentTag	/Date\s\w*/ contained
syn keyword magikCommentTagCode	Function Methodology Parameters Returns Revision Purpose Usage contained
syn match   magikChar		/%\k*/

hi def link magikStatement	Statement
hi def link magikIdentifier	Function
hi def link magikConditional	Conditional
hi def link magikRepeat		Repeat
hi def link magikString		String
hi def link magikOperator	Operator
hi def link magikPreCondit	PreCondit
hi def link magikComment	Comment
hi def link magikTodo		Todo
hi def link magikPrama		Define
hi def link magikNumber		Number
hi def link magikBuiltin	Function
hi def link magikException	Exception
hi def link magikSpaceError	Error

hi def link magikSymbol		Special
hi def link magikBool		Boolean
hi def link magikSpecialComment	SpecialComment
hi def link magikLabel		Label
hi def link magikType		Type
hi def link magikDef		Typedef
hi def link magikCommentTag	Underlined
hi def link magikCommentTagCode	Underlined
hi def link magikChar		Character

let b:current_syntax = "magik"

" vim: ts=8
