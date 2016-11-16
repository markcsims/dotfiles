call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'matze/vim-move'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'Valloric/YouCompleteMe'
Plug 'mxw/vim-jsx'
Plug 'juvenn/mustache.vim'
Plug 'mileszs/ack.vim'
"Plug 'Shougo/neocomplete.vim'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
"Plug 'terryma/vim-multiple-cursors'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'godoctor/godoctor.vim'
Plug 'fatih/vim-go'

call plug#end()

filetype plugin indent on

syntax on
syntax enable

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:netrw_liststyle=3
let g:move_key_modifier = 'C'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map= { 'mode': 'passive' }
" let g:syntastic_javascript_checkers = ['jsxhint', 'jscs']

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

if has("gui_gtk2")
elseif has("gui_macvim")
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
elseif has("gui_win32")
  set guifont=Consolas:h11
end

set nocompatible
set nobackup
"set noswapfile

set laststatus=2
set autowrite
set ruler
set timeoutlen=500                "Ever notice a slight lag after typing <leader> + cmd? This lowers the timeout.
set hidden                        "Switch between buffers without saving
"set encoding=utf-8 nobomb         "Encoding off for nvim
set binary
set history=1000
set laststatus=2
set incsearch
set synmaxcol=256
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set copyindent
set preserveindent
set backspace=indent,eol,start
set showcmd
set relativenumber
set number
"set cursorline                    "Highlight current line
set scrolloff=3                   "Always 3 lines visible
set shortmess=I                   "No intro message
set smartindent
set autoindent
set showmatch                     "Show matching brackets
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
colorscheme elflord

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <Tab>  <C-w>w

" buffer management
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

"tab management
nnoremap <Leader>tf  :tabnext<CR>
nnoremap <Leader>tb  :tabprev<CR>
nnoremap <Leader>tt  :tabedit<Space>
nnoremap <Leader>tm  :tabm<Space>
nnoremap <Leader>td  :tabclose<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-l> :SyntasticCheck<CR>
"copy to clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

if has("autocmd")                 "Source the vimrc file after saving it.
  augroup myvimrchooks             "This way, you don't have to reload Vim to see the changes.
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif

