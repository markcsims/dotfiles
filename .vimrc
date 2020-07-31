call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'matze/vim-move'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'mileszs/ack.vim'

Plug 'sheerun/vim-polyglot'
Plug 'godoctor/godoctor.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'Quramy/tsuquyomi'
Plug 'SirVer/ultisnips'
Plug 'luochen1990/rainbow'
Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'jlanzarotta/bufexplorer'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

filetype plugin indent on

syntax on
syntax enable

let g:rainbow_conf = {
\   'ctermfgs': ['LightBlue', 'LightMagenta', 'LightGreen', 'LightCyan', 'LightRed', 'LightYellow']
\}
let g:rainbow_active = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:netrw_liststyle=3
let g:move_key_modifier = 'C'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](dist|node_modules)$'
  \ }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:polyglot_disabled = ['graphql']
"
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = '--module commonjs --target ES2016 --lib ES2015 --experimentalDecorators'
let g:syntastic_typescript_tsc_args = "--module commonjs --target ES2016 --lib ES2015 --experimentalDecorators"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:UseNumberToggleTrigger = 0
let g:prettier#exec_cmd_async = 1

set rtp+=~/.vim/godoctor.vim
set t_Co=256

if has("gui_gtk2")
elseif has("gui_macvim")
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
elseif has("gui_vimr")
  set guifont=SauceCodePowerline-Medium:h14
elseif has("gui_win32")
  set guifont=Consolas:h11
end

set nocompatible
set nobackup

set laststatus=2
set autowrite
set ruler
set timeoutlen=500
set hidden
set binary
set history=1000
set incsearch
set synmaxcol=256
set smarttab
set expandtab
set copyindent
set preserveindent
set backspace=indent,eol,start
set showcmd
set relativenumber
set number
set scrolloff=3
set shortmess=I
set smartindent
set autoindent
set showmatch
set ignorecase
set smartcase
set wrap
set whichwrap+=<,>,[,]
set textwidth=80
set formatoptions=qrn1

set wildmenu
set wildmode=longest:full,full

set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup
try
  set undodir=~/.vim/tmp/undo//
  set undofile
catch
endtry

if exists("+spelllang")
  set spelllang=en_gb
endif

let macvim_skip_colorscheme = 1
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
set list listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<
set background=dark
colorscheme ron

noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <Tab>  <C-w>w

nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

nnoremap <Leader>tf  :tabnext<CR>
nnoremap <Leader>tb  :tabprev<CR>
nnoremap <Leader>tt  :tabedit<Space>
nnoremap <Leader>tm  :tabm<Space>
nnoremap <Leader>td  :tabclose<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-l> :SyntasticCheck<CR>

nnoremap <C-y> "+y
vnoremap <C-y> "+y

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif
