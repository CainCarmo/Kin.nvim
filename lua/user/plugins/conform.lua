return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 200,
      lsp_format = "fallback",
    },
  },
  event = "BufReadPost",
  config = function(_, opts)
    opts.formatters_by_ft = knvim.langs.formatter.names

    require("conform").setup(opts)
  end,
}
