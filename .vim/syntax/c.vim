" syntax match FunctionName "\<[a-zA-Z_]\w*\ze\s*("
highlight FunctionName ctermfg=Green guifg=Green

" Opérateurs
syntax match cOperator "[+\-*/%<>=!&|^~]"
highlight cOperator ctermfg=Yellow guifg=Yellow


" syntax match cArrow "->\s*\zs\w\+"
highlight cArrow ctermfg=DarkMagenta guifg=#491296
