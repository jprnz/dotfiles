return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require "plugins.configs.conform",
    init = function()
      vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
    end,
  },

  {
    "echasnovski/mini.indentscope",
    opts = function()
      ani = require('mini.indentscope').gen_animation.none()
      return {
        symbol = "│",
        mappings = {
          object_scope = 'ii',
          object_scope_with_border = 'ai',
          goto_top = '[i',
          goto_bottom = ']i',
        },
        draw = {
          delay = 0,
        },
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      require "plugins.configs.lsp"
    end,
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall" },
        opts = {},
      },
      { "williamboman/mason-lspconfig" },
    },
  },

  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdateSync",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },
}


