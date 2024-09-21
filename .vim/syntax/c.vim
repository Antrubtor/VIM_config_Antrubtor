" Match pointer operators
syntax match cPointerOperator "\.\|\(->\)\|\&\|\*" containedin=cStructMember
highlight cPointerOperator ctermfg=Cyan guifg=#00d9ff

" Match struct members and pointed elements
syntax match cStructMember "\(\.\|\(->\)\)\s*\w*" containedin=cPointerOperator
highlight cStructMember guifg=#3495ad


syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1
hi def link cUserFunction Function
