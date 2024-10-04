return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "andersevenrud/cmp-tmux",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "rafamadriz/friendly-snippets",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },

    init = function()
      local cmp = require("cmp")

      -- use buffer source for / and ?
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } },
      })

      -- use cmdline and path source for ':' 
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {
            { name = 'path' }
          }, 
          {
            { name = 'cmdline' }
          }
        ),
      })
    end,
    opts = function()
      return require("plugins.configs.cmp")
    end,
  },
}

