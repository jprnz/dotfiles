return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "andersevenrud/cmp-tmux",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
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

      {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup()
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          local cmp = require "cmp"
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
    },
    -- made opts is a function cuz cmp config calls cmp module
    init = function()
      -- use buffer source for / and ?
      require("cmp").setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- use cmdline and path source for ':' 
      require("cmp").setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
    opts = function()
      return require("plugins.configs.cmp")
    end,
  },
}

