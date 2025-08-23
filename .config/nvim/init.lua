-- Modernized Neovim config (init.lua) based on your .vimrc
-- Uses lazy.nvim for plugin management
-- Place this file at ~/.config/nvim/init.lua

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Colorschemes & UI
  { 'EdenEast/nightfox.nvim' },
  { 'chriskempson/base16-vim' },
  { 'vim-airline/vim-airline' },
  { 'vim-airline/vim-airline-themes' },
  -- Essentials
  { 'tpope/vim-sensible' },
  { 'tpope/vim-commentary' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-markdown' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-vinegar' },
  { 'matze/vim-move' },
  -- File navigation
  { 'scrooloose/nerdtree', cmd = 'NERDTreeToggle' },
  { 'ctrlpvim/ctrlp.vim' },
  { 'editorconfig/editorconfig-vim' },
  -- Search
  { 'mileszs/ack.vim' },
  -- Language support
  { 'sheerun/vim-polyglot' },
  { 'godoctor/godoctor.vim' },
  { 'jelera/vim-javascript-syntax' },
  { 'leafgarland/typescript-vim' },
  { 'peitalin/vim-jsx-typescript' },
  { 'pangloss/vim-javascript' },
  { 'maxmellon/vim-jsx-pretty' },
  { 'fatih/vim-go' },
  -- Completion & LSP
  { 'neoclide/coc.nvim', branch = 'release' },
  { 'github/copilot.vim' },
  -- Neovim native plugins
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  -- { 'HiPhish/rainbow-delimiters.nvim' }, -- Uncomment if needed
})

-- General settings
vim.opt.backup = true
vim.opt.backup = false
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.ruler = true
vim.opt.timeoutlen = 500
vim.opt.hidden = true
vim.opt.binary = true
vim.opt.history = 1000
vim.opt.incsearch = true
vim.opt.synmaxcol = 256
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.showcmd = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 3
vim.opt.shortmess:append('I')
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.whichwrap:append('<,>,[,]')
vim.opt.textwidth = 80
vim.opt.formatoptions = 'qrn1'
vim.opt.wildmenu = true
vim.opt.wildmode = { 'longest:full', 'full' }
vim.opt.backupdir = vim.fn.expand('~/.vim/tmp/backup//')
vim.opt.directory = vim.fn.expand('~/.vim/tmp/swap//')
vim.opt.undodir = vim.fn.expand('~/.vim/tmp/undo//')
vim.opt.undofile = true
vim.opt.spelllang = 'en_gb'
vim.opt.sessionoptions = { 'resize', 'winpos', 'winsize', 'buffers', 'tabpages', 'folds', 'curdir', 'help' }
vim.opt.list = true
vim.opt.listchars = { eol = '¬', tab = '>-', trail = '·', extends = '>', precedes = '<' }
vim.opt.background = 'dark'
vim.cmd('colorscheme carbonfox')

-- Airline
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g.airline_theme = 'badwolf'
vim.g['airline#extensions#tabline#fnamemod'] = ':t'
vim.g.airline_powerline_fonts = 1
vim.g.UseNumberToggleTrigger = 0

-- NERDTree
vim.g.NERDTreeShowHidden = 1

-- netrw
vim.g.netrw_liststyle = 3

-- ctrlp
vim.g.move_key_modifier = 'C'
vim.g.ctrlp_map = '<c-p>'
vim.g.ctrlp_cmd = 'CtrlP'
vim.g.ctrlp_working_path_mode = 'ra'
vim.g.ctrlp_show_hidden = 1
vim.g.ctrlp_custom_ignore = {
  dir = [[\v[\/](dist|node_modules|\.yarn|\.git|\.serverless|\.jest-cache|build|build-cjs)$]],
}

-- Typescript
vim.g.typescript_indent_disable = 1
vim.g.typescript_compiler_binary = 'tsc'
vim.g.typescript_compiler_options = '--module commonjs --target ES2016 --lib ES2015 --experimentalDecorators'

-- Go
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_types = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_build_constraints = 1

-- Polyglot
vim.g.polyglot_disabled = { 'graphql' }

-- Key mappings
local map = vim.keymap.set
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<Tab>', '<C-w>w')
map('n', '<Leader>l', ':ls<CR>')
map('n', '<Leader>b', ':bp<CR>')
map('n', '<Leader>f', ':bn<CR>')
map('n', '<Leader>g', ':e#<CR>')
for i = 1, 10 do
  map('n', '<Leader>' .. tostring(i % 10), ':' .. tostring(i) .. 'b<CR>')
end
map('n', '<Leader>tf', ':tabnext<CR>')
map('n', '<Leader>tb', ':tabprev<CR>')
map('n', '<Leader>tt', ':tabedit <Space>')
map('n', '<Leader>tm', ':tabm <Space>')
map('n', '<Leader>td', ':tabclose<CR>')
map('n', '<C-n>', ':NERDTreeToggle<CR>')
map('n', '<C-y>', '"+y')
map('v', '<C-y>', '"+y')
map('n', '<Leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<Leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<Leader>ss', [[:let _s=@/ | %s/\s\+$//e | let @/=_s |<CR>]], { silent = true })

-- Coc.nvim mappings (some may need to be set after plugin loads)
vim.g.coc_global_extensions = {
  'coc-json', 'coc-git', 'coc-yaml', 'coc-snippets', 'coc-jest', 'coc-eslint', 'coc-tsserver'
}

-- Treesitter config
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "dockerfile", "go", "gitignore", "git_rebase", "graphql", "javascript", "json", "markdown", "typescript", "vim", "yaml" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

-- Telescope config
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file',
      '.gitignore'
    }
  }
}

-- Autocommands (Lua API)
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.razor',
  command = 'set syntax=html',
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    if vim.fn.winnr('$') == 1 and vim.b.NERDTreeType == 'primary' then
      vim.cmd('q')
    end
  end,
})

-- Source config on write
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'init.lua',
  command = 'source ~/.config/nvim/init.lua',
})

-- For legacy Vimscript functions, you can use vim.cmd[[ ... ]] blocks if needed
-- Example:
-- vim.cmd[[
-- function! DecodeURI(uri)
--   return substitute(a:uri, '%\([a-fA-F0-9][a-fA-F0-9]\)', '\=nr2char("0x" . submatch(1))', "g")
-- endfunction
-- ]]

-- If you need to port more custom Vimscript, let me know!
