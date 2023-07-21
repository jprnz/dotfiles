-- Start impatient if available
local have_impatient, impatient = pcall(require, "impatient")
if have_impatient then
  impatient.enable_profile()
end

-- Define paths
local g = vim.g
g.cache_dir = os.getenv("HOME") .. "/.nvim"

-- Disable some default plugins
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

require("bootstrap")
require("options")
require("mappings")
require('plugins')
