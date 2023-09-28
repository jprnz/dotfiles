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
  use 'aserowy/tmux.nvim'
  use 'echasnovski/mini.ai'
  use 'echasnovski/mini.bufremove'
  use 'echasnovski/mini.comment'
  use 'echasnovski/mini.surround'
  use 'echasnovski/mini.splitjoin'
  use 'ethanholz/nvim-lastplace'
  use 'folke/which-key.nvim'
  use 'kylechui/nvim-surround'

  -- LSP Installer and Config (using mason)
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'folke/trouble.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  -- Autocomplete
  use {'ms-jpq/coq_nvim', branch = 'coq', run = ':COQdeps'}
  use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
  use {'ms-jpq/coq.thirdparty', branch = '3p'}

  -- UI 
  use 'kyazdani42/nvim-web-devicons'
  use 'hoob3rt/lualine.nvim'
  use 'themercorp/themer.lua'
  use 'echasnovski/mini.indentscope'

  -- Navigation
  use 'kyazdani42/nvim-tree.lua'

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Languages
  use 'alaviss/nim.nvim'
  use {'snakemake/snakemake', rtp = 'misc/vim/'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Initialize
require('nvim-lastplace').setup()
require('mini.ai').setup()
require('mini.bufremove').setup()
require('mini.comment').setup()
require('mini.splitjoin').setup()
require('mini.surround').setup()
require('tmux').setup({copy_sync = {enable = false}})
require('trouble').setup()

require('mini.indentscope').setup({
    symbol = "│",
    options = { try_as_border = true }
  }
)

-- Plugins with additional configurations
require("plugins.config.coq")
require("plugins.config.gitsigns")
require("plugins.config.lsp")
require("plugins.config.lualine")
require("plugins.config.nvim-tree")
require("plugins.config.telescope")
require("plugins.config.themer")
require("plugins.config.treesitter")
require("plugins.config.which-key")

-- Workaround for 'rtp' issue
-- https://github.com/wbthomason/packer.nvim/issues/274
if not vim.g.packer_compiled_loaded and vim.loop.fs_stat(packer_compile_path) then
  vim.cmd(string.format('source %s', packer_compile_path))
  vim.g.packer_compiled_loaded = true
end
