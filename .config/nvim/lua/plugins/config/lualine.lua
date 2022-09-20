local opts = {
  theme = "ayu",
  icons_enabled = false,
  component_separators = { left = '', right = ''},
  section_separators = { left = '', right = ''},

}

require("lualine").setup({options = opts})
