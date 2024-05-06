vim.loader.enable()

-- Define paths
local g = vim.g
g.cache_dir = os.getenv("HOME") .. "/.nvim"

-- Disable some default plugins
vim.g.loaded_getscript = 0
vim.g.loaded_getscriptPlugin = 0
vim.g.loaded_vimball = 0
vim.g.loaded_vimballPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_logiPat = 0
vim.g.loaded_rrhelper = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_netrwSettings = 0
vim.g.loaded_netrwFileHandlers = 0

require("bootstrap")
require("options")
require('plugins')

