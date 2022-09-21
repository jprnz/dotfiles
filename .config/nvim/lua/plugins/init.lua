-- Plugin definition and loading
local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_compile_path = fn.stdpath('config') .. '/plugin/packer_compiled.lua'

local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- Load Packer
cmd([[packadd packer.nvim]])

-- Initialize plugins
require('packer').startup(function(use)

  -- Utils
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'folke/which-key.nvim'
  use 'aserowy/tmux.nvim'
  use 'ethanholz/nvim-lastplace'
  use 'windwp/nvim-autopairs'
  use 'machakann/vim-sandwich'
  use 'norcalli/nvim-colorizer.lua'

  -- LSP Installer and Config (using mason)
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'folke/trouble.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'p00f/nvim-ts-rainbow'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = "make" }

  -- Autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'l3mon4d3/luasnip'
  use 'ray-x/cmp-treesitter'
  use 'andersevenrud/cmp-tmux'

  -- UI 
  use 'kyazdani42/nvim-web-devicons'
  use 'hoob3rt/lualine.nvim'
  use 'themercorp/themer.lua'

  -- Navigation
  use 'kyazdani42/nvim-tree.lua'

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Languages
  use 'sheerun/vim-polyglot'
  use {'snakemake/snakemake', rtp = 'misc/vim/'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)


-- Plugins with configurations
require("plugins.config.lsp")
require("plugins.config.cmp")
require("plugins.config.telescope")
require("plugins.config.gitsigns")
require("plugins.config.nvim-tree")
require("plugins.config.lualine")
require("plugins.config.which-key")
require("plugins.config.themer")
require("plugins.config.treesitter")
require("plugins.config.trouble")
require("plugins.config.lastplace")
require("plugins.config.autopairs")

-- Workaround for 'rtp' issue
-- https://github.com/wbthomason/packer.nvim/issues/274
if not vim.g.packer_compiled_loaded and vim.loop.fs_stat(packer_compile_path) then
  vim.cmd(string.format('source %s', packer_compile_path))
  vim.g.packer_compiled_loaded = true
end
