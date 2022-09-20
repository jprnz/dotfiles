-- From https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local types = require("cmp.types")

local cmdline_mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping({
        c = function()
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            else
                feedkey("<Down>")
            end
        end,
    }),
    ["<C-k>"] = cmp.mapping({
        c = function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            else
                feedkey("<Up>")
            end
        end,
    }),
    ["<Tab>"] = cmp.mapping({
        c = function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            else
                fallback()
            end
        end,
    }),
})


local opts = {
  completion = {
    autocomplete = false,
  },

  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  sources = {
    { name = "path" },
    { name = "tmux" },
    { name = "treesitter" },
    { name = "cmdline" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer" },
  },

  cmp.setup.cmdline("/", {
    mapping = cmdline_mapping,
    completion = {
      autocomplete = {
        types.cmp.TriggerEvent.TextChanged,
      },
    },
    sources = cmp.config.sources({
      { name = "buffer" },
      { name = "tmux" },
    }),
  }),

  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  }
}

cmp.setup(opts)
