return {
  {
    "shatur/neovim-ayu",
    name = "ayu ",
    lazy = false,
    priority = 1000,
    init = function()
      require('ayu').colorscheme()
    end,
    opts = {
      overrides = {
        Normal = { bg = '#000000' },
        SignColumn = { bg = '#000000', fg = '#565b66' },
        WinSeparator = { bg = '#000000', fg = '#565b66' },
        NonText = { fg = '#565b66' },
        LineNr = { fg = '#565b66' },
        MiniPickBorder = { },
        MiniPickBorderBusy = { },
        MiniPickBorderText = { },
        MiniPickCursor = { },
        MiniPickIconDirectory = { },
        MiniPickIconFile = { },
        MiniPickHeader = { },
        MiniPickMatchCurrent = { },
        MiniPickMatchMarked = { },
        MiniPickMatchRanges = { },
        MiniPickNormal = { },
        MiniPickPreviewLine = { },
        MiniPickPreviewRegion = { },
        MiniPickPrompt = { },
      },
    },
  },
}
