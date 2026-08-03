-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git', lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Ensure NVM node binaries are in PATH for LSP servers
local function add_nvm_to_path()
  -- Try to get node path from the shell environment
  local node_bin = vim.fn.system('which node 2>/dev/null'):gsub('\n', '')
  if node_bin ~= '' and vim.fn.executable(node_bin) == 1 then
    local node_dir = vim.fn.fnamemodify(node_bin, ':h')
    if not string.find(vim.env.PATH, node_dir, 1, true) then
      vim.env.PATH = node_dir .. ':' .. vim.env.PATH
    end
  end
end
add_nvm_to_path()

require('lazy').setup({
  -- Colorschemes & UI
  { 'EdenEast/nightfox.nvim' },
  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-lualine/lualine.nvim' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-fugitive' },
  { 'matze/vim-move' },
  -- LSP and completion
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp', lazy = true },
  { 'saadparwaiz1/cmp_luasnip', lazy = true },
  { 'zbirenbaum/copilot.lua', cmd = 'Copilot', event = 'InsertEnter', config = function() require('copilot').setup({}) end },
  { 'zbirenbaum/copilot-cmp', config = function() require('copilot_cmp').setup() end },
  -- TypeScript/JavaScript enhancements
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = function() require('nvim-autopairs').setup({}) end },
  { 'windwp/nvim-ts-autotag', config = function() require('nvim-ts-autotag').setup({}) end },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  { 'numToStr/Comment.nvim', config = function() require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  }) end },
  { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'stevearc/conform.nvim' },
  -- Neovim native plugins
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  {
      'nvim-treesitter/nvim-treesitter',
      branch='main',
      build = ':TSUpdate',
      config = function()
        local ts = require('nvim-treesitter')

        ts.setup({
          -- auto_install is still supported here
          auto_install = true,
          highlight = {
            enable = true,
            -- additional_vim_regex_highlighting is largely deprecated/defaulted in main
          },
          indent = {
            enable = true,
          },
        })

        -- In the new 'main' branch, use .install() instead of ensure_installed
        ts.install({
          "bash", "css", "dockerfile", "go", "gomod", "gosum", "gowork",
          "gitignore", "git_rebase", "graphql", "html", "javascript",
          "jsdoc", "json", "lua", "markdown", "regex", "scss", "tsx",
          "typescript", "vim", "yaml"
        })
      end
   },
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
    lualine_c = { {'filename', path = 1 } },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  tabline = {},
  extensions = {'nvim-tree', 'quickfix', 'fugitive'}
}

-- Suppress lspconfig deprecation warnings
vim.deprecate = function() end

-- Options
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
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
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
vim.opt.colorcolumn = '80'
vim.opt.formatoptions = 'qrn1'
vim.opt.wildmenu = true
vim.opt.wildmode = { 'longest:full', 'full' }
vim.opt.backupdir = vim.fn.stdpath('data') .. '/backup//'
vim.opt.directory = vim.fn.stdpath('data') .. '/swap//'
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo//'
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
local builtin = require('telescope.builtin')
map('n', '<Leader>ff', function() 
  builtin.find_files({ hidden = true })
end)
map('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<Leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<Leader>ss', [[:let _s=@/ | %s/\s\+$//e | let @/=_s |<CR>]], { silent = true })
map('n', '<C-n>', ':NvimTreeToggle<CR>')
map('n', '<S-h>', ':BufferLineCyclePrev<CR>')
map('n', '<S-l>', ':BufferLineCycleNext<CR>')

-- LSP keymaps
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'Find references' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
map('n', '<Leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
map('n', '<Leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })
map('n', '<Leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Trouble keymaps
map('n', '<Leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
map('n', '<Leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics (Trouble)' })
map('n', '<Leader>xl', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
map('n', '<Leader>xq', '<cmd>Trouble quickfix toggle<cr>', { desc = 'Quickfix List (Trouble)' })

-- Formatter setup (Prettier for JS/TS, gofmt/goimports for Go)
require('conform').setup({
  formatters_by_ft = {
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    json = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    markdown = { 'prettier' },
    go = { 'goimports', 'gofmt' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Trouble setup for diagnostics
require('trouble').setup {}

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript/JavaScript LSP with enhanced settings
if vim.fn.executable('typescript-language-server') == 1 then
  local ts_setup = function(server)
    server.setup {
      capabilities = capabilities,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = 'all',
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
          },
        },
      },
    }
  end
  if lspconfig.ts_ls then
    ts_setup(lspconfig.ts_ls)
  elseif lspconfig.tsserver then
    ts_setup(lspconfig.tsserver)
  end
end

-- ESLint LSP
if vim.fn.executable('vscode-eslint-language-server') == 1 then
  lspconfig.eslint.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        command = 'EslintFixAll',
      })
    end,
  }
end

-- LSP setup with availability checks
if vim.fn.executable('lua-language-server') == 1 then
  lspconfig.lua_ls.setup { capabilities = capabilities }
end

if vim.fn.executable('gopls') == 1 then
  lspconfig.gopls.setup {
    capabilities = capabilities,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          shadow = true,
          nilness = true,
          unusedwrite = true,
          useany = true,
        },
        staticcheck = true,
        gofumpt = true,
        usePlaceholders = true,
        completeUnimported = true,
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  }
end

local cmp = require('cmp')
local luasnip_ok, luasnip = pcall(require, 'luasnip')

cmp.setup {
  snippet = {
    expand = function(args)
      if luasnip_ok then
        luasnip.lsp_expand(args.body)
      end
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
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
}

require('telescope').setup{
  defaults = {
    hidden = true,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--glob', "!**/.git/*"
    },
    file_ignore_patterns = { 'node_modules', '^%.git/', 'dist/', 'build/' },
  }
}

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.razor',
  command = 'set syntax=html',
})

-- Set .env files to use sh syntax
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '.env', '.env.*' },
  command = 'set filetype=sh',
})

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})
