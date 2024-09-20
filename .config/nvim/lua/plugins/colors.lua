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
        SignColumn = { bg = '#000000' },
        WinSeparator = { bg = '#000000', fg = '#1b1b1b' },
        NonText = { fg = '#1b1b1b' },
        LineNr = { fg = '#1b1b1b' },
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
