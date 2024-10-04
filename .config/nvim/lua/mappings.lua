local map = vim.keymap.set

-- Helper function
local keymap = function(mode, keys, cmd, opts)
  opts = opts or {}
  if opts.silent == nil then opts.silent = true end
  vim.keymap.set(mode, keys, cmd, opts)
end

-- Shorter version of the most frequent way of going outside of terminal window
keymap('t', [[<C-h>]], [[<C-\><C-N><C-w>h]])

-- Move inside completion list with <TAB>
keymap('i', [[<Tab>]], [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
keymap('i', [[<S-Tab>]], [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })

-- Delete selection in Select mode (helpful when editing snippet placeholders)
keymap('s', [[<BS>]], [[<BS>i]])

-- Better command history navigation
keymap('c', '<C-p>', '<Up>', { silent = false })
keymap('c', '<C-n>', '<Down>', { silent = false })

-- Stop highlighting search results
keymap('n', '<M-/>', ':let v:hlsearch = 1 - v:hlsearch<CR>', { desc = 'Toggle hlsearch' })

-- Paste before/after linewise
keymap({ 'n', 'x' }, '[p', '<Cmd>exe "put! " . v:register<CR>', { desc = 'Paste Above' })
keymap({ 'n', 'x' }, ']p', '<Cmd>exe "put "  . v:register<CR>', { desc = 'Paste Below' })


keymap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- windows - resize
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- windows - leader
keymap("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
keymap("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
keymap("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
keymap("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

-- Move Lines
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
--keymap("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
keymap("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")

--keywordprg
keymap("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- commenting
keymap("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
keymap("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- new file
keymap("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
keymap("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
keymap("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- formatting
--map({ "n", "v" }, "<leader>cf", function() LazyVim.format({ force = true }) end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })

---- lazygit
--keymap("n", "<leader>gg", function() LazyVim.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
--keymap("n", "<leader>gG", function() LazyVim.lazygit() end, { desc = "Lazygit (cwd)" })
--keymap("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
--keymap("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "Git Browse" })
--
--keymap("n", "<leader>gf", function()
--  local git_path = vim.api.nvim_buf_get_name(0)
--  LazyVim.lazygit({args = { "-f", vim.trim(git_path) }})
--end, { desc = "Lazygit Current File History" })
--
--keymap("n", "<leader>gl", function()
--  LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
--end, { desc = "Lazygit Log" })
--keymap("n", "<leader>gL", function()
--  LazyVim.lazygit({ args = { "log" } })
--end, { desc = "Lazygit Log (cwd)" })

-- highlights under cursor
keymap("n", "<leader>hc", vim.show_pos, { desc = "Inspect Pos" })
keymap("n", "<leader>ht", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- Terminal Mappings
keymap("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
keymap("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
keymap("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
keymap("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
keymap("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
keymap("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
keymap("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

