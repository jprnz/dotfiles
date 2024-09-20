require("mini.files").setup()

local toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles
  local new_filter = show_dotfiles and filter_show or filter_hide
  require("mini.files").refresh({ content = { filter = new_filter } })
end

local map_split = function(buf_id, lhs, direction, close_on_file)
  local rhs = function()
    local new_target_window
    local cur_target_window = require("mini.files").get_explorer_state().target_window
    if cur_target_window ~= nil then
      vim.api.nvim_win_call(cur_target_window, function()
        vim.cmd("belowright " .. direction .. " split")
        new_target_window = vim.api.nvim_get_current_win()
      end)

      require("mini.files").set_target_window(new_target_window)
      require("mini.files").go_in({ close_on_file = close_on_file })
    end
  end

  local desc = "Open in " .. direction .. " split"
  if close_on_file then
    desc = desc .. " and close"
  end
  vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

-- show on bottom
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesWindowUpdate',
  callback = function(args)
    local win_id = args.data.win_id
    local config = vim.api.nvim_win_get_config(win_id)

    -- Customize window-local settings
    config.anchor = "SW"
    config.row = vim.o.lines
    config.height = 20
    vim.api.nvim_win_set_config(win_id, config)
  end
})

-- split open mappings
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id

    vim.keymap.set(
      "n", "g.", toggle_dotfiles,
      { buffer = buf_id, desc = "Toggle hidden files" }
    )

    map_split(buf_id, "<C-w>s", "horizontal", false)
    map_split(buf_id, "<C-w>v", "vertical", false)
    map_split(buf_id, "<C-w>S", "horizontal", true)
    map_split(buf_id, "<C-w>V", "vertical", true)
  end,
})

