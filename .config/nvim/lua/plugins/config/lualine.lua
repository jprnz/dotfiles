local signs = {
  Branch = "",
  Config = "",
  Error = "",
  GitAdded = "",
  GitModified = "",
  GitRemoved = "",
  GitRenamed = "",
  Hint = "",
  Info = "",
  Warn = "",
}

local navic = require("nvim-navic")

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local function get_lsp(msg)
  msg = msg or "Inactive"
  local buf_clients = vim.lsp.buf_get_clients()
  if next(buf_clients) == nil then
    if type(msg) == "boolean" or #msg == 0 then
      return "Inactive"
    end
    return msg
  end
  local buf_client_names = {}

  for _, client in pairs(buf_clients) do
    if client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end

  return table.concat(buf_client_names, ", ")
end


local opts = {
  options = {
    icons_enabled = true,
    component_separators = "",
    section_separators = "",
    theme = "ayu_dark",
    globalstatus = false,
  },
  sections = {
    lualine_a = {
      {
        "mode", 
        fmt = function(str) return str:sub(1,1) end, 
      },
    },
    lualine_b = { 
      { 
        "filename",
        filestatus = true,
        path = 4,
        symbols = {
          modified = '+',
          readonly = '-',
          unnamed = '[...]',
          newfile = '[...]',
        }
      },
    },
    lualine_c = {
      "navic",
    },
    lualine_x = {
      "diagnostics",
    },
    lualine_y = {
      { 
        "b:gitsigns_head", 
        icon = "",
        cond = conditions.check_git_workspace,
      },
      "diff",
    },
    lualine_z = {
      { "location", padding = 0 },
      { "progress", padding = 1 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

require("lualine").setup(opts)
