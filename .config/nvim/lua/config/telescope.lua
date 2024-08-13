local ignore_files = {
  ".snakemake/", "conda/", ".git/", "__pycache__/*", "node_modules/",
  ".gradle/", "build/", "env/", "gradle/", "venv/", "%.7z", "%.avi",
  "%.JPEG", "%.JPG", "%.V", "%.RAF", "%.burp", "%.bz2", "%.cache",
  "%.class", "%.dll", "%.docx", "%.dylib", "%.epub", "%.exe", "%.flac",
  "%.ico", "%.ipynb", "%.jar", "%.jpeg", "%.jpg", "%.lock", "%.mkv",
  "%.mov", "%.mp4", "%.otf", "%.pdb", "%.pdf", "%.png", "%.rar",
  "%.sqlite3", "%.svg", "%.tar", "%.tar.gz", "%.ttf", "%.webp", "%.zip",
}

local telescope = require 'telescope'
local actions = require 'telescope.actions'
local opts = {
  defaults = {
    file_ignore_patters = ignore_files,
    prompt_prefix = "> ",
    selection_caret = "> ",
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    set_env = {['COLORTERM'] = 'truecolor'},

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

		lsp_handlers = {
      disable = {},
			location = {
				telescope = {},
				no_results_message = 'No references found',
			},
			symbol = {
				telescope = {},
				no_results_message = 'No symbols found',
			},
			call_hierarchy = {
				telescope = {},
				no_results_message = 'No calls found',
			},
			code_action = {
				telescope = require('telescope.themes').get_dropdown({}),
			},
		},

    aerial = {
      show_nesting = {
        ["_"] = false,
        json = true,
        yaml = true,
      },
    },
  },
},


require('telescope').setup(opts)
require('telescope').load_extension('fzf')
require('telescope').load_extension('aerial')
require('telescope').load_extension('lsp_handlers')


-- Clobber theme
theme = require('telescope.themes').get_ivy({
  layout_config = {
    prompt_position = "bottom",
  },
  borderchars = {
    prompt =  {'─', ' ', '─', ' ', ' ', ' ', '─', '─'},
    results = {'─', ' ', ' ', ' ', '─', '─', ' ', ' '},
    preview = {'─', ' ', '─', '│', '┬', '─', '─', '└'}},
  scroll_strategy = 'cycle',
  dynamic_preview_title = true,
  results_title = "",
  prompt_title = "",
})

-- Add keymaps
local map = vim.keymap.set
local mopts = { silent = true }
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files(theme)<cr>", mopts)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep(theme)<cr>", mopts)
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers(theme)<cr>", mopts)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags(theme)<cr>", mopts)

