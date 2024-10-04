return {
  {
    "echasnovski/mini.pick",
    opts = require("plugins.configs.pick"),
    dependencies = "echasnovski/mini.extra",
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = {},
  },

  {
    'echasnovski/mini.icons',
    opts = {},
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  {
    "xiyaowong/virtcolumn.nvim",
    config = function() end
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "echasnovski/mini.statusline",
    config = function()
      require("mini.statusline").setup { set_vim_settings = false }
    end,
  },

  {
    "echasnovski/mini.files",
    lazy = false,
    config = function()
      require("plugins.configs.mini-files")
    end,
  },

  { "echasnovski/mini.ai", opts = {} },
  { "echasnovski/mini.align", opts = {} },
  { "echasnovski/mini.basics", opts = {} },
  { "echasnovski/mini.bracketed", opts = {} },
  { "echasnovski/mini.move", opts = {} },
  { "echasnovski/mini.splitjoin", opts = {} },
  { "echasnovski/mini.visits", opts = {} },
  { "echasnovski/mini.surround", opts = {} },
}
