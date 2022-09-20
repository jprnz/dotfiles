local utils = require("plugins.config.lsp.utils")
local cmp = require("cmp_nvim_lsp")

local M = {
  -- Servers to be installed
  install =  {
    "awk_ls",
    "bashls",
    "diagnosticls",
    "sumneko_lua",
    "r_language_server",
    "pyright",
    -- "nimls",
    -- "perlnavigator",
    -- "sqlls"
    --
  },
  
  -- Optional language-specific configurtations
  config = {
    sumneko_lua = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "use" }
          }
        }
      }
    }
  },

  -- Global config and flags for cmp
  default_config = {
    on_attach = utils.on_attach,
    capabilities = cmp.update_capabilities(utils.capabilities),
    flags = {
      debounce_text_changes = 150
    }
  }
}

return M
