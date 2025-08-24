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
  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-lualine/lualine.nvim' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'matze/vim-move' },
  -- LSP and completion
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'L3MON4D3/LuaSnip' },
  { 'zbirenbaum/copilot-cmp' },
  { 'github/copilot.vim' },
  -- Neovim native plugins
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  -- { 'CopilotCNC/CopilotChat.nvim', dependencies = { 'github/copilot.vim' } },

})
require('nvim-tree').setup {}
require('bufferline').setup {}
require('lualine').setup {
  options = {
    theme = 'nightfox',
    section_separators = {'', ''},
    component_separators = {'', ''},
    icons_enabled = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {},
  extensions = {'nvim-tree', 'quickfix', 'fugitive'}
}
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
map('n', '<C-n>', ':NvimTreeToggle<CR>')
-- map('n', '<Leader>cc', ':CopilotChat<CR>', { desc = 'Open Copilot Chat' })

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {}
if lspconfig.ts_ls and type(lspconfig.ts_ls.setup) == 'function' then
  lspconfig.ts_ls.setup {}
elseif lspconfig.tsserver and type(lspconfig.tsserver.setup) == 'function' then
  lspconfig.tsserver.setup {}
end
lspconfig.gopls.setup {}

local cmp = require('cmp')
require('copilot_cmp').setup()
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "dockerfile", "go", "gitignore", "git_rebase", "graphql", "javascript", "json", "markdown", "typescript", "vim", "yaml" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

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

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.razor',
  command = 'set syntax=html',
})


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
