" VIMRC by Antrubtor: https://github.com/Antrubtor/VIM_config_Antrubtor

" T is for terminal (crtl + w - N for normal mode)
" crtl + t is for nerdtree (chose a file and press t to open in new tab)
" F8 is for tagbar

" C + j to format all code
" select and = for format a part of code

" \re to rename a variable
" \co to show error suggestion

" :Man <code> to use man directly in vim

" F6 enable / disable background
" F5 enable / disable Auto Compl Pop

" , to comment / uncomment

" crtl + up/down arrow to change buffer
" crtl + right/left to arrow changes tabs

" crtl + g to open GDB

" crtl + click to go on variable/function declaration

" crtl + k to find function (and crtl+j/k to move between result)
" crtl + f to find file



" General =====================================================================================================
set encoding=utf-8
set number " Line number
set relativenumber "relativenumber line number
set hlsearch " Highlight while searching
set colorcolumn=80 " Restricted length bar
set belloff=all " Remove beeping
set clipboard^=unnamed,unnamedplus " Use clipboard
set backspace=eol,start,indent " Fix backspace
set mouse=a " Use mouse everywhere
set linebreak " Wrapping text
set cursorline " Highlight the line under scheme
set showmatch " Show parentheses match
syntax enable
syntax on
set lazyredraw " For performence
" Display space after lines
set list listchars=tab:>.,trail:~,extends:>,precedes:<
highlight SpecialKey ctermfg=blue
packadd termdebug " Turn on GDB in vim
set mousemodel=popup " For mouse moving windows
" resize split automatically
autocmd VimResized * wincmd =

" Converting tabs to spaces
set expandtab
set smarttab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=8

"Indent
set smartindent
set autoindent
set cindent



" For not reload the configuration each time

augroup AutoReloadVimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin list ------------------------------------------------------------------------------
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'preservim/tagbar'
Plugin 'preservim/nerdtree' |
            \ Plugin 'Xuyuanp/nerdtree-git-plugin' |
            \ Plugin 'ryanoasis/vim-devicons' |
            \ Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocompletion
Plugin 'vim-scripts/AutoComplPop'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-utils/vim-man'
Plugin 'rhysd/vim-clang-format'
Plugin 'preservim/nerdcommenter'
Plugin 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' } " Searchbar
Plugin 'prabirshrestha/vim-lsp' " language server plugin
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim' " Autocomplete with lsp
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'wakatime/vim-wakatime'
" Plugin 'vimsence/vimsence'
" Plugin list end --------------------------------------------------------------------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Plugin config ----------------------------------------------------------------------------

" ~~~Theme config~~~
set termguicolors
let g:tokyonight_enable_italic = 1
let g:tokyonight_style = 'night'
colorscheme tokyonight

" ~~~Nerdtree config~~~
noremap <C-t> :NERDTreeToggle<cr>
" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Other tree plugin config
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeFileExtensionHighlightFullName = 1

" Syntax higlight plugin config
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" ~~~Airline config~~~
let g:gitgutter_enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline#extensions#branch#enabled = 1
"let g:airline_extensions = ['hunks', 'branch', 'tabline']
let g:airline_powerline_fonts=1

let g:airline#extensions#gitgutter#enabled = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']


" ~~~Tagbar config~~~
let g:tagbar_enabled = 0
let g:airline_section_y = airline#section#create_right(['coc_current_function', 'bookmark', 'scrollbar', 'tagbar', 'taglist', 'vista', 'gutentags', 'gen_tags', 'omnisharp', 'grepper', 'codeium', 'filetype'])

nmap <F8> :TagbarToggle<CR>
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" ~~~Autocompletion config~~~
set complete+=kspell,d
" set shortmess+=c

" Better completion experience

" ~~~AutoComplPop ACP config~~~
" Disable ACP at the start
let g:acp_enableAtStartup = 0
let g:acp_was_enabled = 0 " Track if ACP was enabled by F5

" Toggle ACP on/off with F5
function! ToggleACP()
  if g:acp_enableAtStartup == 1
    let g:acp_enableAtStartup = 0
    echo "AutoComplPop Disabled"
    AcpDisable
  else
    let g:acp_enableAtStartup = 1
    echo "AutoComplPop Enabled"
    AcpEnable
  endif
endfunction

nnoremap <F5> :call ToggleACP()<CR>

" Enter to select in completion menu (still applicable)
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Prevent ACP from interfering with asyncomplete
autocmd User AsyncCompleteStart if g:acp_enableAtStartup == 1 | let g:acp_was_enabled = 1 | call AcpDisable() | endif
autocmd User AsyncCompleteStop if g:acp_was_enabled == 1 | call AcpEnable() | let g:acp_was_enabled = 0 | endif





" Asyncomplete config
let g:asyncomplete_auto_popup = 1  " Active le popup automatique des suggestions
let g:asyncomplete_timer_cycle = 50  " Temps d'attente avant d'afficher les suggestions (en ms)
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:lsp_document_highlight_enabled= 1 " don't highlight references to the symbol under the cursor
highlight lspReference ctermbg=black guibg=black
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_completeopt = 0
let g:lsp_diagnostics_enabled = 1 " lsp error/warning
let g:lsp_diagnostic_highlights_insert_mode_enabled = 0 " Remove popup of the error
let g:lsp_diagnostics_signs_insert_mode_enabled = 0
let g:lsp_diagnostics_virtual_text_align = "after"
let g:lsp_diagnostics_virtual_text_prefix = ">"
let g:lsp_diagnostics_padding_left = 3

" let g:lsp_diagnostics_signs_priority_map = {
"             \'LspError': 11,
"             \'LspWarning': 0,
"             \'clangd_LspWarning': 0,
"             \'clangd_LspInformation': 0
"             \}
set signcolumn=yes " always show sign column (right)


" Click to go on declaration (funcion, variable...)
nnoremap <C-LeftMouse> <Leftmouse>:LspDefinition<CR>
inoremap <C-LeftMouse> <Leftmouse><Esc>:LspDefinition<CR>i


" Register LSP for asyncomplet
augroup asyncomplete_setup
    autocmd!
    autocmd User lsp_setup call asyncomplete#register_source({
        \ 'name': 'lsp',
        \ 'priority': 10,
        \ 'allowlist': ['python', 'c', 'cpp'],
        \ 'completor': function('asyncomplete#sources#lsp#completor'),
    \ })
augroup END

let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview " Show if 1 suggest, no auto insert, no auto select

" Remap tab and shift+tab for suggest
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


nmap <buffer> <Leader>co :LspCodeAction <CR>
nmap <buffer> <Leader>re :LspRename <CR>


" ~~~Clang config~~~
nnoremap <C-j> :ClangFormat<CR>
vnoremap = :!clang-format<CR>
" let g:clang_format#style_options = {
" \ 'BasedOnStyle': 'LLVM',
" \ 'IndentWidth': 4,
" \ 'ColumnLimit': 80,
" \ 'BreakBeforeBraces': 'Allman',
" \ }


" ~~~nerdcommenter config~~~
nmap , <plug>NERDCommenterToggle
vmap , <plug>NERDCommenterToggle<CR>gv



" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1

vmap . <Plug>NERDCommenterUncomment

let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
    \ 'c': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'cpp': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'java': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    \ 'python': { 'left': '#', 'leftAlt': '"""', 'rightAlt': '"""' },
    \ }


" ~~~Leaderf config~~~
noremap <C-k> :Leaderf function<CR>
noremap <C-f> :Leaderf file<CR>
let g:Lf_WindowPosition = 'popup'



" Macros ======================================================================================================


" ___Resize mode macro___

" Creates a mapping to enable/disable resizing mode
let g:resizing_mode = 0

" Creates a mapping to enable/disable resizing mode
nnoremap + :call ToggleResizingMode()<CR>

function! ToggleResizingMode()
    if g:resizing_mode
        " If the mode is active, deactivates it and displays a message
        let g:resizing_mode = 0
        echom "Resize mode disabled"
    else
        " If the mode is disabled, activates it and displays a message
        let g:resizing_mode = 1
        echom "Resizing mode enabled"
    endif
endfunction

" Create mapping
nnoremap <expr> h (g:resizing_mode ? '<C-W><' : 'h')
nnoremap <expr> j (g:resizing_mode ? '<C-W>-' : 'j')
nnoremap <expr> k (g:resizing_mode ? '<C-W>+' : 'k')
nnoremap <expr> l (g:resizing_mode ? '<C-W>>' : 'l')
nnoremap <expr> <Left> (g:resizing_mode ? '<C-W><' : '<Left>')
nnoremap <expr> <Down> (g:resizing_mode ? '<C-W>-' : '<Down>')
nnoremap <expr> <Up> (g:resizing_mode ? '<C-W>+' : '<Up>')
nnoremap <expr> <Right> (g:resizing_mode ? '<C-W>>' : '<Right>')

" Remove message
set showcmd
set cmdheight=1
autocmd CursorMoved * echon "" | redraw

" Switch tabs with arrow
nnoremap <C-Left> gT
nnoremap <C-Right> gt

" Switch buffer with arrow
nnoremap <C-Up> :bprevious <cr>
nnoremap <C-Down> :bnext <cr>


" ___Terminal mode macro___
nnoremap <S-t> :term<CR><C-w>L


" ___Open GDB macro___
autocmd FileType c,cpp nnoremap <C-g> :Termdebug<CR><C-w>j<C-w>j<C-w>H<C-w>w


" ___Background change macro___

let g:background_enabled = 1

function! ToggleBackground()
    if g:background_enabled == 1
        highlight Normal ctermbg=NONE
        let g:background_enabled = 0
    else
        highlight Normal ctermbg=236 guibg=#282A36
        let g:background_enabled = 1
    endif
endfunction

nnoremap <F6> :call ToggleBackground()<CR>


" Allows you to not hold shift for azerty keyboards
nnoremap à 0
nnoremap & 1
nnoremap é 2
nnoremap " 3
nnoremap ' 4
nnoremap ( 5
nnoremap - 6
nnoremap è 7
nnoremap _ 8
nnoremap ç 9
