local wk = require "which-key"
local capabilities = vim.lsp.protocol.make_client_capabilities()

local M = {}


function M.on_attach(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  M.set_keys(client, bufnr)
end

function M.format()
  vim.lsp.buf.format()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
function M.toggle_diagnostics()
  M.diagnostics_active = not M.diagnostics_active
  if M.diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

function M.set_keys(client, buffer)
  local cap = client.server_capabilities

  local keymap = {
    buffer = buffer,
    ["<leader>"] = {
      j = {
        name = "+goto",
        D = { vim.lsp.buf.declaration, "declaration" },
        d = { vim.lsp.buf.definition, "definition" },
        r = { vim.lsp.buf.references, "find references" },
        i = { vim.lsp.buf.implementation, "implementation" },
        t = { vim.lsp.buf.type_definition, "type definition" },
      },
      c = {
        name = "+code",
        t = { toggle_diagnostics, "toggle diagnostics" },
        r = { vim.lsp.buf.rename, "rename" },
        a = {
          { vim.lsp.buf.code_action, "code action" },
          { vim.lsp.buf.code_action, "code action", mode = "v" },
        },
        f = {
          {
            M.format,
            "format document",
            cond = cap.documentFormatting,
          },
          {
            M.format,
            "format range",
            cond = cap.documentRangeFormatting,
            mode = "v",
          },
        },
        d = { vim.diagnostic.open_float, "line diagnostics" },
      },
    },
    ["<C-k>"] = { vim.lsp.buf.signature_help, "signature help", mode = { "n", "i" } },
    ["K"] = { vim.lsp.buf.hover, "hover" },
    ["[d"] = { vim.diagnostic.goto_prev, "next diagnostic" },
    ["]d"] = { vim.diagnostic.goto_next, "prev diagnostic" },
  }

  wk.register(keymap)
end

M.handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = false,
    severity_sort = true,
    code_action_icon = ">",
    float = {
      focusable = false,
      style = "minimal",
      source = "always",
      header = "",
      prefix = "",
    },
  }),

}

return M
