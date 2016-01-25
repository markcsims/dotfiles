call plug#begin()
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'matze/vim-move'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/vim-emoji'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

call plug#end()

filetype on                       "Enable filetypes
filetype plugin on
filetype indent on
filetype plugin indent on

syntax on
syntax enable
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:netrw_liststyle=3
let g:move_key_modifier = 'C'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:airline_powerline_font = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"issue: hides double quote in json files
"let b:showSpacesConceal=1
"let b:showSpaces=1

if has("gui_gtk2")                "Set font type and size. Depends on the resolution. Larger screens, prefer h20
elseif has("gui_macvim")
  set guifont=Monaco:h14
elseif has("gui_win32")
  set guifont=Consolas:h11
end

set nocompatible
set nobackup
"set noswapfile

set autowrite                     "Write the old file out when switching between files.
set ruler                         "Display current cursor position in lower right corner.
set timeoutlen=500                "Ever notice a slight lag after typing <leader> + cmd? This lowers the timeout.
set hidden                        "Switch between buffers without saving
"set encoding=utf-8 nobomb         "Encoding off for nvim
set binary
set history=1000
set laststatus=2
set incsearch
set synmaxcol=256                 " Syntax coloring lines that are too long just slows down the world
set smarttab                      "Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set copyindent
set preserveindent
set backspace=indent,eol,start    "Fix backspace indentation
set showcmd                       "Show command in bottom right portion of the screen
set relativenumber
set number                        "Show lines numbers
"set cursorline                    "Highlight current line
set scrolloff=3                   "Always 3 lines visible
set shortmess=I                   "No intro message
set smartindent                   "Indent stuff
set autoindent
set showmatch                     "Show matching brackets
set ignorecase
set smartcase
set wrap                          "Better line wrapping
set whichwrap+=<,>,[,]
set textwidth=80
set formatoptions=qrn1

if has("autocmd")                 "Source the vimrc file after saving it.
  augroup myvimrchooks             "This way, you don't have to reload Vim to see the changes.
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif

set wildmenu                      "More useful command-line completion
set wildmode=longest:full,full    "Autocompletion for commands and find

set backupdir=~/.vim/tmp/backup// "Backups
set directory=~/.vim/tmp/swap//   "Swap files
set backup                        "Enable backup
try
  set undodir=~/.vim/tmp/undo//  "Undo dir
  set undofile
catch
endtry

if exists("+spelllang")           "Spell checking
  set spelllang=en_gb
endif

set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help
set list listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<
set background=dark             "Set the color scheme. Change this to your preference.
let g:solarized_termcolors=256
set t_Co=256
colorscheme elflord "solarized

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

map <C-n> :NERDTreeToggle<CR>
