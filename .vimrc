"-----------------------------------------
" vim-plug
"-----------------------------------------
call plug#begin('~/.vim/plugged')
  Plug 'cocopon/iceberg.vim'
  Plug 'dense-analysis/ale'
  Plug 'hashivim/vim-terraform'
  Plug 'itchyny/lightline.vim'
  Plug 'jmcantrell/vim-virtualenv'
  Plug 'maximbaz/lightline-ale'
  Plug 'scrooloose/nerdtree'
  Plug 'simeji/winresizer'
call plug#end()


"-----------------------------------------
" Basic settings
"-----------------------------------------
set autoindent
set cursorline
set expandtab
set fenc=utf-8
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set noswapfile
set number
set smartcase
set smartindent
set splitbelow
set splitright
set viminfo=

filetype indent on
filetype plugin on


"-----------------------------------------
" File type settings
"-----------------------------------------
autocmd BufRead,BufNewFile *.template set filetype=cloudformation.yaml

autocmd FileType js   setlocal sw=2 sts=2 ts=2 et
autocmd FileType sh   setlocal sw=2 sts=2 ts=2 et
autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et


"-----------------------------------------
" Iceberg
"-----------------------------------------
colorscheme iceberg
set background=dark


"-----------------------------------------
" Asynchronous Lint Engine
"-----------------------------------------
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_linters = {
  \ 'python'   : ['pylsp'],
  \ 'terraform': ['tflint'],
  \ }
let g:ale_fixers = {
  \ 'bash'     : ['shfmt'],
  \ 'python'   : ['black', 'isort'],
  \ 'terraform': ['terraform'],
  \ }

nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)


"-----------------------------------------
" lightline.vim
"-----------------------------------------
let g:lightline = {
  \ 'colorscheme': 'iceberg',
  \ 'component_expand' : {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \   },
  \ 'component_type': {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left'
  \   },
  \ 'active': {
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype' ],
  \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
  \   },
  \ }


"-----------------------------------------
" NERDTree
"-----------------------------------------
autocmd vimenter * NERDTree


"-----------------------------------------
" winersizer.vim
"-----------------------------------------
let g:winresizer_start_key = '<C-T>'
let g:winresizer_keycode_cancel = 122
