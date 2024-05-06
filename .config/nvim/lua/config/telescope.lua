local ignore_files = {
  ".snakemake/",
  "conda/",
  ".git/",
  ".gradle/",
  "__pycache__/*",
  "build/",
  "env/",
  "gradle/",
  "node_modules/",
  "venv/",
  "%.7z",
  "%.avi",
  "%.JPEG",
  "%.JPG",
  "%.V",
  "%.RAF",
  "%.burp",
  "%.bz2",
  "%.cache",
  "%.class",
  "%.dll",
  "%.docx",
  "%.dylib",
  "%.epub",
  "%.exe",
  "%.flac",
  "%.ico",
  "%.ipynb",
  "%.jar",
  "%.jpeg",
  "%.jpg",
  "%.lock",
  "%.mkv",
  "%.mov",
  "%.mp4",
  "%.otf",
  "%.pdb",
  "%.pdf",
  "%.png",
  "%.rar",
  "%.sqlite3",
  "%.svg",
  "%.tar",
  "%.tar.gz",
  "%.ttf",
  "%.webp",
  "%.zip"
}

local telescope = require 'telescope'
local actions = require 'telescope.actions'
local opts = {
  defaults = {
    prompt_prefix = "> ",
    selection_caret = "> ",

    file_ignore_patters = ignore_files,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    set_env = {['COLORTERM'] = 'truecolor'},

    --scroll_strategy = 'cycle',
    --sorting_strategy = "ascending",

    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    },
  },

  mappings = {
    i = {
      ["<C-n>"] = false,
      ["<C-p>"] = false,
      ["<c-f>"] = actions.to_fuzzy_refine,
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
    },
    n = {
      ["<C-n>"] = false,
      ["<C-p>"] = false,
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
    },
  },

  pickers = {
    buffers = {
      sort_mru = true,
      sort_lastused = true,
      show_all_buffers = true,
      ignore_current_buffer = true,
      mappings = {
        i = { ['<c-x>'] = 'delete_buffer' },
        n = { ['<c-x>'] = 'delete_buffer' },
      },
    },
  },

  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },

    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = ignore_files,
      disable_devicons = false,
    },

    file_browser = {
      hijack_netrw = true,
    },
  },
}

require('telescope').setup(opts)
require('telescope').load_extension('fzf')
require('telescope').load_extension('frecency')

-- Clobber theme
theme = require('telescope.themes').get_ivy()
theme['find_command'] = opts.find_command
theme['layout_strategy'] = 'vertical'
theme['prompt_position'] = "bottom"
theme['dynamic_preview_title'] = true
theme['results_title'] = ""
theme['prompt_title'] = ""
theme['layout_config']['anchor'] = 'SW'
theme['layout_config']['height'] = .6
theme['layout_config']['width'] = vim.o.columns


-- Add keymaps
local map = vim.keymap.set
local mopts = { silent = true }
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files(theme)<cr>", mopts)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep(theme)<cr>", mopts)
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers(theme)<cr>", mopts)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags(theme)<cr>", mopts)
map('n', '<leader>fc', "<cmd>lua require('telescope.builtin').treesitter(theme)<cr>", mopts)
