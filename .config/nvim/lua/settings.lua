-- Enable all filetype plugins 
vim.cmd[[filetype plugin indent on]]

-- Leader key
vim.g.mapleader = ' '

local opt = vim.opt

-- General
opt.autochdir = true
opt.autoindent = true
opt.breakindent = true
opt.breakindentopt = 'list:-1'
opt.colorcolumn = "80"
opt.cursorline = true
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.jumpoptions = "view"
opt.cursorlineopt = 'screenline,number'
opt.expandtab = true
opt.formatoptions = 'rqnl1j'
opt.ignorecase = true
opt.incsearch = true
opt.infercase = true
opt.laststatus = 3
opt.linebreak = true
opt.list = true
opt.mouse = 'a'
opt.number = true
opt.pumheight = 10
opt.ruler = false
opt.shada = "'100,<50,s10,:1000,/100,@100,h"
opt.shiftwidth = 2
opt.showmode = true
opt.showtabline = 0
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.switchbuf = 'useopen,uselast'
opt.tabstop = 2
opt.termguicolors = true
opt.virtualedit = 'block'
opt.winblend = 0
opt.wrap = false
opt.timeoutlen = 300
opt.fillchars:append('diff:─,foldopen=▾,foldclose=▸')
opt.iskeyword:append('-')

-- Spelling
opt.spelllang    = 'en'
opt.spelloptions = 'camel'
opt.complete:append('kspell')
opt.complete:remove('t')


-- Fold
opt.foldenable = false 
--if vim.fn.has("nvim-0.10") == 1 then
--  opt.smoothscroll = true
--  opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
--  opt.foldmethod = "expr"
--  opt.foldtext = ""
--else
--  opt.foldmethod = "indent"
--  opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
--end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- Complete
if vim.fn.has('nvim-0.11') == 1 then
  opt.completeopt:append('fuzzy')
end

-- Status line
opt.statusline = "" ..
  '[b%n] ' ..                         -- buffer number
  '%F ' ..                            -- file name
  '%h%m%r%w' ..                       -- flags
  '%=' ..                             -- right align
  '[%{strlen(&ft)?&ft:\'none\'}|' ..  -- filetype
  '%{strlen(&fenc)?&fenc:&enc}|' ..   -- encoding
  '%{&fileformat}]' ..                -- file format
  '[%l|%c%V|%P]'                      -- offset

-- Backups
opt.backup = true
opt.undofile = true
opt.swapfile = true

-- Create paths and assign
local cachedirs = {
  backupdir = vim.fs.joinpath(vim.env.HOME, '.vim', 'backup'),
  directory = vim.fs.joinpath(vim.env.HOME, '.vim', 'swap'),
  undodir = vim.fs.joinpath(vim.env.HOME, '.vim', 'undo'),
}

for key, value in pairs(cachedirs) do
  if vim.fn.isdirectory(value) == 0 then
    vim.fn.mkdir(value, 'p')
  end
  opt[key] = value .. '//'
end

-- Colors
-- Enable syntax highlighing if it wasn't already (as it is time consuming)
-- Don't use defer it because it affects start screen appearance
if vim.fn.exists('syntax_on') ~= 1 then vim.cmd('syntax enable') end

-- Define pattern for a start of 'numbered' list. This is responsible for
-- correct formatting of lists when using `gw`. This basically reads as 'at
-- least one special character (digit, -, +, *) possibly followed some
-- punctuation (. or `)`) followed by at least one space is a start of list
-- item'
opt.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Autocommands
-- Add timestamp as extension for backup files
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('timestamp_backupext', { clear = true }),
  desc = 'Add timestamp to backup extension',
  pattern = '*',
  callback = function()
    opt.backupext = '-' .. vim.fn.strftime('%Y%m%d%H%M')
  end,
})

vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })

