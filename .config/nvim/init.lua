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
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'matze/vim-move' },
  -- File navigation
  -- Search
  -- Language support
  -- Completion & LSP
  { 'github/copilot.vim' },
  -- Neovim native plugins
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
})

-- General settings
vim.opt.backup = false
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.ruler = true
vim.opt.timeoutlen = 500
vim.opt.hidden = true
vim.opt.binary = true
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

-- NERDTree
-- netrw

-- ctrlp

-- Typescript

-- Go

-- Polyglot

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
map('n', '<Leader>tf', ':tabnext<CR>')
map('n', '<Leader>tb', ':tabprev<CR>')
map('n', '<Leader>tt', ':tabedit <Space>')
map('n', '<Leader>tm', ':tabm <Space>')
map('n', '<Leader>td', ':tabclose<CR>')
map('n', '<C-y>', '"+y')
map('v', '<C-y>', '"+y')
map('n', '<Leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<Leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<Leader>ss', [[:let _s=@/ | %s/\s\+$//e | let @/=_s |<CR>]], { silent = true })

-- Coc.nvim mappings (some may need to be set after plugin loads)

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
