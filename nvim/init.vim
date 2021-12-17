set encoding=utf-8

let g:polyglot_disabled = ['elm']

call plug#begin("~/.vim/plugged")
 Plug 'dense-analysis/ale'
 Plug 'neoclide/coc.nvim', { 'branch': 'release' }
 Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
 Plug 'Yggdroot/indentLine'
 Plug 'sheerun/vim-polyglot'
 Plug 'tpope/vim-sleuth'
 Plug 'itchyny/lightline.vim'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
 Plug 'elmcast/elm-vim'
 Plug 'dracula/vim', { 'as': 'dracula' }
 Plug 'Raimondi/delimitMate'
call plug#end()

" Leader
let mapleader = " "

syntax on
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set noshowmode

" Keep 10 lines below and above the cursor
set scrolloff=10

" Show relative line numbers
set relativenumber

" Open new split panes to right and bottom
set splitbelow
set splitright

set cursorline

" Remap ^ to 0
nmap 0 ^

" Remove search highlighting
nnoremap <Leader><space> :noh<cr>

" Remove whitespace at the end ofthe line
autocmd BufWritePre * :%s/\s\+$//e

" Copy relative file path to clipboard
nmap <leader>cp :let @+ = expand("%")<cr>

" Copy to system clipboard
set clipboard+=unnamedplus

" Don't auto comment
set formatoptions-=cro

" Access vimrc and then source it
nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'scss': ['prettier'],
\   'html': ['prettier'],
\   'elixir': ['mix_format']
\}
let g:ale_linters = {
\   'javascript': ['eslint']
\}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

let g:lightline = {
\ 'component_function': {
\   'filename': 'LightlineFilename',
\ },
\ 'colorscheme': 'dracula',
\}

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
inoremap jk <Esc>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

hi Comment cterm=italic

colorscheme dracula

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
