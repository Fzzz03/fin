-- Set leader key to space for easier access
vim.g.mapleader = ' '

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.wrap = false

-- Key mappings
local map = vim.api.nvim_set_keymap
map('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true }) -- Clear search highlights
map('n', '<leader>s', ':w<CR>', { noremap = true, silent = true })          -- Save file
map('n', '<leader>x', ':q<CR>', { noremap = true, silent = true })          -- Quit
map('n', '<leader>b', ':!make build<CR>', { noremap = true, silent = true }) -- Build project
map('n', '<leader>z', ':!make clean<CR>', { noremap = true, silent = true }) -- Clean build
map('n', '<leader>r', ':!python3 %<CR>', { noremap = true, silent = true })  -- Run Python file

-- Plugin manager setup (packer.nvim)
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'          -- Packer itself
  use 'neovim/nvim-lspconfig'           -- LSP configurations
  use 'hrsh7th/nvim-cmp'                -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
  use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting
  use 'nvim-tree/nvim-tree.lua'         -- File explorer (updated repo)
  use 'nvim-lualine/lualine.nvim'       -- Status line (updated repo)
  use 'folke/tokyonight.nvim'           -- TokyoNight theme
  use 'saadparwaiz1/cmp_luasnip'        -- Snippet completion source
  use 'L3MON4D3/LuaSnip'                -- Snippet engine
  use 'morhetz/gruvbox'
  use 'shaunsingh/nord.nvim'
  use 'Mofiqul/dracula.nvim'
end)

-- Autocompletion setup
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- Enable LuaSnip snippets
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),      -- Scroll docs up
    ['<C-f>'] = cmp.mapping.scroll_docs(4),       -- Scroll docs down
    ['<C-Space>'] = cmp.mapping.complete(),       -- Trigger completion
    ['<C-e>'] = cmp.mapping.close(),              -- Close completion menu
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
  },
  sources = {
    { name = 'nvim_lsp' },  -- LSP completions
    { name = 'luasnip' },   -- Snippet completions
  }
})

-- LSP setup
local capabilities = require('cmp_nvim_lsp').default_capabilities() -- Enable LSP autocompletion
local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup{ capabilities = capabilities }   -- JavaScript/TypeScript
lspconfig.clangd.setup{ capabilities = capabilities }  -- C++
lspconfig.pyright.setup{ capabilities = capabilities } -- Python

-- Treesitter setup
require('nvim-treesitter.configs').setup({
  ensure_installed = { "javascript", "typescript", "lua", "cpp", "python" }, -- Add C++ and Python
  highlight = {
    enable = true,
  },
})

-- Status line setup
require('lualine').setup({
  options = { theme = 'tokyonight' }
})

-- Auto-insert templates for new files
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.js",
    command = "0r ~/.config/nvim/templates/js_template.js" -- JavaScript template
})
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.cpp",
    command = "0r ~/.config/nvim/templates/cpp_template.cpp" -- C++ template
})
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.py",
    command = "0r ~/.config/nvim/templates/python_template.py" -- Python template
})

-- LSP key mappings
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)        -- Go to definition
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)              -- Show hover info
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)    -- Rename symbol
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
vim.cmd('colorscheme tokyonight-night')
--vim.cmd('colorscheme gruvbox')
--vim.cmd('colorscheme nord')
--vim.cmd('colorscheme dracula')
--vim.cmd('colorscheme tokyonight')

