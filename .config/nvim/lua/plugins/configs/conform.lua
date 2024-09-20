return {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    snakemake = { "snakefmt", "isort", "black" },
    sh = { "shfmt" },
    r = { "styler" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" },
    },
  },
}
