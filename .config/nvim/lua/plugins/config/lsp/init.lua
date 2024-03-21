require("mason").setup()

local mason_lsp = require("mason-lspconfig")
local lsp = require("lspconfig")

if not mason_lsp then
  return
end

local utils = require("plugins.config.lsp.utils")

mason_lsp.setup({
  automatic_installation = true,
  ensure_installed = {
    "lua_ls",
    "pyright",
    "bashls",
  },
})

mason_lsp.setup_handlers({
  function(server_name)
    lsp[server_name].setup {
      on_attach = utils.on_attach,
      capabilities = utils.capabilities,
      handlers = utils.handlers,
    }
  end,
})

require ('mason-null-ls').setup({
    ensure_installed = {'black'},
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black
  }
})


-- Default diagnostic settings
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = false,
    update_in_insert = true,
    severity_sort = true,
})


-- Set completion icons
local icons = {
  error = ">",
  warn = ">",
  info = ">",
  hint = ">"
}

vim.fn.sign_define("DiagnosticsSignError", { text = icons.error })
vim.fn.sign_define("DiagnosticsSignWarning", { text = icons.warn })
vim.fn.sign_define("DiagnosticsSignInformation", { text = icons.info })
vim.fn.sign_define("DiagnosticsSignHint", { text = icons.hint })

