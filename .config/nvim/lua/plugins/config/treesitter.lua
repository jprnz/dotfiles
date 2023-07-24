local opts = {
  auto_install = true,
  ensure_installed = {
    "lua",
    "vim",
    "markdown",
    "markdown_inline",
    "python",
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },

  indent = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<leader>v', -- maps in normal mode to init the node/scope selection
      node_incremental = '<leader>v', -- increment to the upper named parent
      node_decremental = '<leader>V', -- decrement to the previous node
      scope_incremental = 'grc', -- increment to the upper scope (as defined in locals.scm)
    },
  },

  textobjects = {
    lookahead = true,
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['aC'] = '@conditional.outer',
        ['iC'] = '@conditional.inner',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['[w'] = '@parameter.inner',
      },
      swap_previous = {
        [']w'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
    },
    lsp_interop = {
      enable = true,
      border = 'rounded',
      peek_definition_code = {
        ['df'] = '@function.outer',
        ['dF'] = '@class.outer',
      },
    },
  },
},

require('nvim-treesitter.configs').setup(opts)
