local opt = vim.opt

-- General
opt.autochdir = true                            -- Automatically cd into directory of file
opt.autoread = true                             -- Automatically pull in changes
opt.backspace = vim.opt.backspace + {'nostop'}  -- Allow backspace over features
opt.clipboard = "unnamedplus"                   -- Add X clip support set 
opt.cmdheight = 1                               -- Number of lines for command-line
opt.colorcolumn = "80"                            -- Colorcolumn set to n-chars
opt.completeopt = {"menu", "menuone", "noselect"}        -- Insert mode comp options
opt.copyindent = true                           -- autoindent
opt.cursorline = true                           -- Highlight cursorline
opt.encoding = "utf8"                             -- Ensure UTF8
opt.ffs = "unix,mac,dos"                        -- File format priority
opt.fillchars = { eob = " " }                    -- Diff separator
opt.history = 100                               -- History to remember
opt.hlsearch = true                             -- Highlight search results
opt.ignorecase = true                           -- When searching
opt.incsearch = true                            -- Highlight as
opt.lazyredraw = true                           -- Be lazy
opt.magic = true                                -- Allow special characters in regular expressions
opt.mouse = "a"                                 -- Mouse support
opt.number = true                               -- Line numbering
opt.numberwidth = 3                             -- n-char width of padding
opt.ttyfast = true                                     -- Assume a fast terminal opt.wildignore = "*.o,*~,*.pyc"                     -- Ignore patters in filenames
opt.viewoptions = { 'cursor', 'folds' } -- save/restore just these (with `:{mk,load}view`)
opt.virtualedit = 'block' -- allow cursor to move where there is no text in visual block mode

-- Format
opt.wrap = false                                -- Do not wrap lines
opt.preserveindent = true                       -- Autoindent
opt.scrolloff = 5                               -- Keep n-lines from scolling
opt.showcmd = true                              -- Verbose when reading commands
opt.showmatch = true                            -- Show matching brackets
opt.sidescrolloff = 2                           -- Number of columns to include when side scrolling
opt.smartcase = true                            -- When searching try to be smart about cases

-- Windows
opt.splitright = true
opt.eadirection = 'hor'
vim.o.switchbuf = 'useopen,uselast'

-- UI
opt.emoji = false
opt.ruler = true                                -- Display current position
opt.wildmenu = true                                    -- Trun on wildmenu
opt.wildmode = "longest,full,full"                       -- Make wildmenu a list
opt.wildoptions =  "pum"
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
local cache_dir = os.getenv("HOME") .. "/.config/nvim"
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
opt.statusline = "" ..
  '[b%n] ' ..                         -- buffer number
  '%F ' ..                             -- file name
  '%h%m%r%w' ..                        -- flags
  '%=' ..                              -- right align
  '[%{strlen(&ft)?&ft:\'none\'}|' ..    -- filetype
  '%{strlen(&fenc)?&fenc:&enc}|' ..   -- encoding
  '%{&fileformat}]' ..                -- file format
  '[%l|%c%V|%P]'                    -- offset

-- Grepprg
if vim.fn.executable('rg') > 0 then
  opt.grepprg = [[rg --glob "!.git" --no-heading --vimgrep --follow $*]]
  opt.grepformat = vim.opt.grepformat ^ { '%f:%l:%c:%m' }
end
