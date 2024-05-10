local opt = vim.opt

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
opt.autowrite = true
opt.autochdir = true
opt.autoread = true
opt.backspace = vim.opt.backspace + {'nostop'}
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.colorcolumn = "80"
opt.completeopt = "menu,menuone,noselect"
opt.copyindent = true
opt.cursorline = true
opt.encoding = "utf8"
opt.ffs = "unix,mac,dos"
opt.fillchars = { eob = " " }
opt.history = 100
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.lazyredraw = true
opt.magic = true
opt.mouse = "a"
opt.number = true
opt.numberwidth = 3
opt.ttyfast = true
opt.virtualedit = 'block'
opt.filetype = 'txt'

-- Format opt.wrap = false
opt.preserveindent = true
opt.scrolloff = 5
opt.showcmd = true
opt.showmatch = true
opt.sidescrolloff = 2
opt.smartcase = true

-- Windows
opt.splitright = true
opt.eadirection = 'hor'
vim.o.switchbuf = 'useopen,uselast'

-- UI
opt.termguicolors = true
opt.emoji = false
opt.ruler = true
opt.wildmenu = true
opt.wildmode = "longest,full,full"
opt.wildoptions =  "pum"
opt.signcolumn = "yes:1"
opt.fillchars = {
  diff = '─', -- alternatives = ⣿ ░ ─
  foldopen = '▾',
  foldclose = '▸',
}

-- Timeing
opt.updatetime = 300
opt.timeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 10

-- Indent
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.smarttab = true
opt.shiftround = true

-- Backups
local cache_dir = vim.g.cache_dir
opt.backupdir = cache_dir .. "/backup//"
opt.directory = cache_dir .. "/swap//"
opt.undodir = cache_dir .. "/undo//"
opt.backup = true
opt.undofile = true
opt.swapfile = true

-- Add timestamp as extension for backup files
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('timestamp_backupext', { clear = true }),
  desc = 'Add timestamp to backup extension',
  pattern = '*',
  callback = function()
    opt.backupext = '-' .. vim.fn.strftime('%Y%m%d%H%M')
  end,
})

-- Status line
opt.laststatus = 2                    -- Global status
opt.statusline = "" ..                --
  '[b%n] ' ..                         -- buffer number
  '%F ' ..                            -- file name
  '%h%m%r%w' ..                       -- flags
  '%=' ..                             -- right align
  '[%{strlen(&ft)?&ft:\'none\'}|' ..  -- filetype
  '%{strlen(&fenc)?&fenc:&enc}|' ..   -- encoding
  '%{&fileformat}]' ..                -- file format
  '[%l|%c%V|%P]'                      -- offset

-- Grepprg
if vim.fn.executable('rg') > 0 then
  opt.grepprg = [[rg --glob "!.git" --no-heading --vimgrep --follow $*]]
  opt.grepformat = vim.opt.grepformat ^ { '%f:%l:%c:%m' }
end

