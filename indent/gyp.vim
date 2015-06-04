if exists("b:did_indent")
   finish
endif

" setlocal cindent
" setlocal cinkeys+=]
" setlocal cinkeys-=0{
" setlocal cinoptions+=j1,J1

setlocal expandtab
setlocal nosmartindent
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal indentexpr=GetGYPIndent()
setlocal indentkeys=!^F,o,O,0],0}

function! GetGYPIndent()
  if getline(v:lnum) =~ '[}\]]$'
    return indent(v:lnum) - &l:shiftwidth
  endif
  if getline(v:lnum - 1) =~ '[{[]$'
    return indent(v:lnum) + &l:shiftwidth
  endif
  return -1
endfunction

let b:undo_indent = "setl expandtab< smartindent< softtabstop< shiftwidth< indentexpr< indentkeys<"
let b:did_indent = 1
