function! SwiftDoc()
    
" Line to insert to.
let prevLineNo = line(".") - 1
" Get the current line.
let line = getline('.')
" If line is empty add an argument so we don't get the usage from MarkupGen.
if strlen(line) == 0
    line = "random"
endif 

" Execute the command and insert the stdout in previous line.
:execute prevLineNo . 'read !MarkupGen-bin "' . line . '" 2> /dev/null'

endfunc

command! -nargs=0 SwiftDoc call SwiftDoc()
