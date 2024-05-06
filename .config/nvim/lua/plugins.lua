local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim' 
local packer_compile_path = fn.stdpath('data') .. '/site/pack/packer/compiled.nvim'

local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Load packer
vim.cmd([[packadd packer.nvim]])

require('packer').startup(function(use)
  -- Utils
  use ({
    {'wbthomason/packer.nvim'},
    {'lewis6991/gitsigns.nvim', config = [[require('config.gitsigns')]]},
    {'nvim-lua/plenary.nvim'},
    {'nvim-lua/popup.nvim'},
    {'kyazdani42/nvim-tree.lua'},
    {'folke/which-key.nvim'},
    --{'aserowy/tmux.nvim', config = [[require('tmux.nvim').setup()]]},
    {'echasnovski/mini.ai', config = [[require('mini.ai').setup()]]},
    {'echasnovski/mini.bufremove', config = [[require('mini.bufremove').setup()]]},
    {'echasnovski/mini.comment', config = [[require('mini.comment').setup()]]},
    {'echasnovski/mini.surround', config = [[require('mini.surround').setup()]]},
    {'ethanholz/nvim-lastplace', config = [[require('nvim-lastplace').setup()]]},
    ---{'stevearc/aerial.nvim', config = [[require('aerial').setup()]]},

    -- UI 
    {'kyazdani42/nvim-web-devicons'},
    {'hoob3rt/lualine.nvim', config = [[require('config.lualine')]]},
    {'themercorp/themer.lua', config = [[require('config.themer')]]},
    {'norcalli/nvim-colorizer.lua', config = [[require('colorizer').setup()]]},
    {'echasnovski/mini.indentscope', 
        config = function() 
          require('mini.indentscope').setup({
            symbol = "│",
            options = { try_as_border = true }
          })
        end},

   -- LSP Installer and Config (using mason)
   {'neovim/nvim-lspconfig',
     config = [[require('config.lsp')]],
     requires = {
       {'folke/trouble.nvim', config = [[require('config.trouble')]]},
       'williamboman/mason.nvim',
       'williamboman/mason-lspconfig.nvim',
       'jay-babu/mason-null-ls.nvim',
       'nvimtools/none-ls.nvim'}},

   -- Treesitter
   {'nvim-treesitter/nvim-treesitter',
     config = [[require('config.treesitter')]],
     requires = {
       'nvim-treesitter/nvim-treesitter-textobjects',
       'JoosepAlviste/nvim-ts-context-commentstring'}},


   -- Telescope
   {'nvim-telescope/telescope.nvim',
     config = [[require('config.telescope')]],
     requires = {
     'nvim-telescope/telescope-file-browser.nvim',
     'nvim-telescope/telescope-frecency.nvim',
     {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}}},

   -- Autocomplete
   {'ms-jpq/coq_nvim', 
       config = [[require('config.coq')]],
       branch = 'coq', run = ':COQdeps',
       requires = {
         {'ms-jpq/coq.artifacts', branch = 'artifacts'},
         {'ms-jpq/coq.thirdparty', branch = '3p'}}},
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)

if vim.g.packer_compiled_loaded and vim.loop.fs_stat(packer_compile_path) then
  vim.cmd(string.format('source %s', packer_compile_path))
  vim.g.packer_compiled_loaded = true
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
