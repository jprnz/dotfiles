local ayu_dark = {
  ["orange"] = "#F29718",
  ["built_in"] = {
    ["type"] = "#36a3d9",
    ["function"] = "#e6b673",
    ["constant"] = "#e6b673",
    ["keyword"] = "#ff7733",
    ["variable"] = "#e6b673",
  },
  ["yellow"] = "#F29718",
  ["heading"] = { ["h1"] = "#0", ["h2"] = "#0" },
  ["cyan"] = "#95E6CB",
  ["green"] = "#B8CC52",
  ["blue"] = "#36A3D9",
  ["magenta"] = "#FFEE99",
  ["dimmed"] = { ["subtle"] = "#3e4b59", ["inactive"] = "#2d3640" },
  ["pum"] = {
    ["bg"] = "#253340",
    ["fg"] = "#e6e1cf",
    ["thumb"] = "#ffffff",
    ["sbar"] = "#808080",
    ["sel"] = { ["fg"] = "#e6e1cf", ["bg"] = "#253340" },
  },
  ["uri"] = "#36a3d9",
  ["match"] = "#0",
  ["accent"] = "#e6b673",
  ["diagnostic"] = { ["warn"] = "#ffa500", ["hint"] = "#d3d3d3", ["info"] = "#add8e6", ["error"] = "#ff0000" },
  ["search_result"] = { ["bg"] = "#ffee99", ["fg"] = "#f1419", ["telescope"] = "#0" },
  ["bg"] = { ["base"] = "#0f1419", ["selected"] = "#151a1e", ["alt"] = "#253340" },
  ["fg"] = "#e6e1cf",
  ["syntax"] = {
    ["struct"] = "#e6b673",
    ["parameter"] = "#36a3d9",
    ["function"] = "#ffb454",
    ["comment"] = "#5c6773",
    ["preproc"] = "#e6b673",
    ["keyword"] = "#ff7733",
    ["tag"] = "#ff7733",
    ["operator"] = "#e7c547",
    ["conditional"] = "#ff7733",
    ["type"] = "#36a3d9",
    ["property"] = "#36a3d9",
    ["include"] = "#e6b673",
    ["number"] = "#ffee99",
    ["string"] = "#b8cc52",
    ["todo"] = { ["fg"] = "#f07178", ["bg"] = "#0" },
    ["constant"] = "#ffee99",
    ["statement"] = "#ff7733",
    ["field"] = "#36a3d9",
    ["constructor"] = "#e6b673",
    ["punctuation"] = "#e6b673",
    ["variable"] = "#0",
  },
  ["diff"] = { ["text"] = "#14191f", ["remove"] = "#8b8b", ["change"] = "#14191f", ["add"] = "#14191f" },
  ["border"] = "#f1419",
  ["inc_search"] = { ["fg"] = "#0", ["bg"] = "#0" },
  ["cursorlinenr"] = "#f29718",
}

local opts = {
  colorscheme = "ayu_dark",
  remaps = {
    palette = {
      ayu_dark = {
        bg = {
          base = "#000000",
          selected = "#14191f",
          alt = "#14191f",
        },
        search_result = {
          bg = "#253340",
          fg = "#ffee99",
        },
        pum = {
          fg = "#d0d0d0",
          thumb = "#af87df",
          bg = "#1c1c1c",
          sel = {
            fg ="#000000",
            bg = "#af87df"
          },
        },
      },
    },
  },
}

require('themer').setup(opts)
