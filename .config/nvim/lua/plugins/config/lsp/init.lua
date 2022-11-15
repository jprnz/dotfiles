-- Default diagnostic settings
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})


-- Set completion icons
local icons = {
  error = "E",
  warn = "W",
  info = "i",
  hint = "H"
}


vim.fn.sign_define("DiagnosticsSignError", { text = icons.error })
vim.fn.sign_define("DiagnosticsSignWarning", { text = icons.warn })
vim.fn.sign_define("DiagnosticsSignInformation", { text = icons.info })
vim.fn.sign_define("DiagnosticsSignHint", { text = icons.hint })

-- Define borders
local borders = {
    { "┌", "FloatBorder" },
    { "─", "FloatBorder" },
    { "┐", "FloatBorder" },
    { "│", "FloatBorder" },
    { "┘", "FloatBorder" },
    { "─", "FloatBorder" },
    { "└", "FloatBorder" },
    { "│", "FloatBorder" },
}

-- Set borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = borders })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = borders })


-- Server configs
local servers = require("plugins.config.lsp.servers")

-- Load mason and install servers if needed
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers.intall,
    automatic_installation = true})

-- Setup language servers
local lspconfig = require("lspconfig")
for _, lsp in ipairs(servers.install) do
    local config = servers.config[lsp] or {}
    config = vim.tbl_extend("keep", config, servers.default_config)
    lspconfig[lsp].setup(config)
end
