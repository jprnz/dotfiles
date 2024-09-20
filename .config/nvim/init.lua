-- load settings
require("settings")
require("mappings")
require("leader")
require("autocmd")

-- bootstrap plugins & lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import everything elese
    import = "plugins"
  },

  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "ayu" } },

  -- automatically check for plugin updates every week
  checker = {
    enabled = false,
    notify = true,
    frequency = 3600 * 24 * 7,
    check_pinned = false,
  },

  -- automatically check for config file changes and reload the ui
  change_detection = {
    enabled = true,
    notify = false,
  },
})
