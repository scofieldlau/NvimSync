-- Install Packer if it isn't already installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.api.nvim_command('packadd packer.nvim')
end

-- Configure Packer
vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

local packer = require('packer')
packer.startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'


  -- Color schemes
  use 'folke/tokyonight.nvim'

  -- Status bar
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- LSP
  use {
	  "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
	  "neovim/nvim-lspconfig",
  }


  -- Improve neovim lsp expericence
  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
  })

  -- Make LSP client fuzzy
  use {
	  'ojroques/nvim-lspfuzzy',
	  requires = {
		  {'junegunn/fzf'},
		  {'junegunn/fzf.vim'},  -- to enable preview (optional)
	},
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'


  -- Fuzzy finding
  use {
	'nvim-telescope/telescope.nvim', tag = '0.1.1',
	-- or                     , branch = '0.1.x',
	requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- FZF sorter for telescope written in c
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Commenting
  use 'terrortylor/nvim-comment'

  -- Surrounding
  -- use 'blackCauldron7/surround.nvim'

  -- Dashboard
  use 'glepnir/dashboard-nvim'


  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Automatically set up Packer when plugins.lua is saved
  vim.api.nvim_exec([[
    augroup Packer
      autocmd!
      autocmd BufWritePost plugins.lua PackerCompile
    augroup end
  ]], false)
end)
