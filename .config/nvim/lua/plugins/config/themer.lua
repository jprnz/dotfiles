local jellyx = {
  ["built_in"]={
    ["keyword"]="#87afdf",
    ["type"]="#afafdf",
    ["constant"]="#df8787",
    ["function"]="#df8787",
    ["variable"]="#df8787",
  },
  ["diff"]={
    ["remove"]="#dfdf87",
    ["change"]="#dfafaf",
    ["add"]="#afdfaf",
    ["text"]="#df8787"
  },
  ["cursorlinenr"]="#585858",
  ["accent"]="#df8787",
  ["magenta"]="#FFEE99",
  ["border"]="#303030",
  ["bg"]={
    ["base"]="#0",
    ["alt"]="#1c1c1c",
    ["selected"]="#121212",
  },
  ["yellow"]="#F29718",
  ["heading"]={
    ["h1"]="#ffdfff",
    ["h2"]="#0",
  },
  ["green"]="#B8CC52",
  ["pum"]={
    ["fg"]="#d0d0d0",
    ["thumb"]="#af87df",
    ["bg"]="#1c1c1c",
    ["sel"]={["fg"]="#0", ["bg"]="#af87df",
    },
    ["sbar"]="#1c1c1c",
  },
  ["uri"]="#afff",
  ["inc_search"]={
    ["fg"]="#0",
    ["bg"]="#0",
  },
  ["orange"]="#F29718",
  ["syntax"]={
    ["todo"]={["fg"]="#dfdf00", ["bg"]="#0" },
    ["number"]="#dfaf87",
    ["constructor"]="#df8787",
    ["punctuation"]="#df8787",
    ["function"]="#dfafdf",
    ["parameter"]="#dfafdf",
    ["keyword"]="#87afdf",
    ["field"]="#dfafdf",
    ["include"]="#afdf87",
    ["constant"]="#ffffaf",
    ["preproc"]="#afdf87",
    ["property"]="#dfafdf",
    ["type"]="#afafdf",
    ["comment"]="#808080",
    ["tag"]="#87afdf",
    ["operator"]="#87afdf",
    ["string"]="#ffffaf",
    ["variable"]="#0",
    ["struct"]="#afafdf",
    ["statement"]="#87afdf",
    ["conditional"]="#87afdf"
  },
  ["cyan"]="#95E6CB",
  ["search_result"]={
    ["bg"]="#0",
    ["fg"]="#0",
    ["telescope"]="#0",
  },
  ["fg"]="#d0d0d0",
  ["blue"]="#36A3D9",
  ["diagnostic"]={
    ["info"]="#add8e6",
    ["error"]="#ff0000",
    ["warn"]="#ffa500",
    ["hint"]="#d3d3d3"
  },
  ["match"]="#0",
  ["gitsigns"]={
    ["remove"]="#df8787",
    ["change"]="#0",
    ["add"]="#afdf87"
  },
  ["dimmed"]={
    ["subtle"]="#0",
    ["inactive"]="#585858"
  }
}


local opts = {
  colorscheme = "ayu_dark",
  remaps = {
    palette = {
      ayu_dark = {
        bg = {
          ["base"] = "#000000",
        }
      }
    }
  }
}

require('themer').setup(opts)
