local ignore_files = {
  ".git/",
  "venv/",
  "conda/",
  ".snakemake/",
}

local telescope = require 'telescope'
local actions = require 'telescope.actions'
local themes = require 'telescope.themes'

local opts = {
  defaults = {
  file_ignore_patters = ignore_files,
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

    layout_strategy = "vertical",
    layout_config = {
      preview_height = .4,
      height = 30
    },
    border = true,
    prompt_prefix = "> ",
    selection_caret = "> ",

    mappings = {
      i = {
        ["<C-n>"] = false,
        ["<C-p>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
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
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    }
  }
}



require('telescope').setup(opts)
require('telescope').load_extension('fzf')

-- Add keymaps
local map = vim.keymap.set
local mopts = { silent = true }

map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", mopts)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", mopts)
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", mopts)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", mopts)
map('n', '<leader>fc', "<cmd>lua require('telescope.builtin').treesitter()<cr>", mopts)
