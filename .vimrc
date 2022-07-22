"-----------------------------------------
" vim-plug
"-----------------------------------------
call plug#begin('~/.vim/plugged')
  Plug 'aliou/bats.vim'
  Plug 'cespare/vim-toml'
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
set fileencoding=utf-8
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

scriptencoding utf-8


"-----------------------------------------
" Highlight multi bytes space
"-----------------------------------------
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif


"-----------------------------------------
" File type settings
"-----------------------------------------
augroup file_type
  autocmd!
  autocmd BufRead,BufNewFile *.template      set filetype=cloudformation.yaml
  autocmd BufRead,BufNewFile *.template.yml  set filetype=cloudformation.yaml
  autocmd BufRead,BufNewFile *.template.yaml set filetype=cloudformation.yaml

  autocmd FileType bats       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType json       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
augroup END


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
  \ 'bash'       : ['bash-language-server', 'shellcheck'],
  \ 'javascript' : ['deno'],
  \ 'json'       : ['json-language-server'],
  \ 'python'     : ['pyright', 'flake8'],
  \ 'terraform'  : ['tflint'],
  \ 'typescript' : ['deno'],
  \ }
let g:ale_fixers = {
  \ 'bash'       : ['shfmt'],
  \ 'javascript' : ['deno'],
  \ 'json'       : ['jq'],
  \ 'python'     : ['black', 'isort'],
  \ 'terraform'  : ['terraform'],
  \ 'typescript' : ['deno'],
  \ }

nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)

nmap <silent> gj <Plug>(ale_go_to_definition)


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
augroup NERDTree
  autocmd!
  autocmd vimenter * NERDTree
augroup END


"-----------------------------------------
" winersizer.vim
"-----------------------------------------
let g:winresizer_start_key = '<C-T>'
let g:winresizer_keycode_cancel = 122


"-----------------------------------------
" cfn-formatter
"-----------------------------------------
"augroup cfn-format
"  autocmd!
"  autocmd BufWritePost *.template silent !cfn-format -w % 2>/dev/null
"augroup END
