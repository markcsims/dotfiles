filetype on                       "Enable filetypes
filetype plugin on
filetype indent on
filetype plugin indent on
execute pathogen#infect()
syntax on
syntax enable

let b:showSpaces=1
let b:showSpacesConceal=1
set nocompatible

set autowrite                     "Write the old file out when switching between files.
set ruler                         "Display current cursor position in lower right corner.
set timeoutlen=500                "Ever notice a slight lag after typing <leader> + cmd? This lowers the timeout.
set hidden                        "Switch between buffers without saving
set encoding=utf-8 nobomb         "Encoding

set synmaxcol=256                 " Syntax coloring lines that are too long just slows down the world

if has("gui_gtk2")                "Set font type and size. Depends on the resolution. Larger screens, prefer h20
elseif has("gui_macvim")
  set guifont=Monaco:h14
elseif has("gui_win32")
  set guifont=Monaco:h14
end

set smarttab                      "Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set copyindent
set preserveindent

set backspace=indent,eol,start    "Fix backspace indentation
set showcmd                       "Show command in bottom right portion of the screen
"set relativenumber
set number                        "Show lines numbers
"set cursorline                    "Highlight current line
set scrolloff=3                   "Always 3 lines visible
set shortmess=I                   "No intro message

set smartindent                   "Indent stuff
set autoindent
set showmatch                     "Show matching brackets

set laststatus=2                  "Always show the status line

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
colorscheme solarized
