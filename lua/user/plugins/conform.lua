return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 200,
      lsp_format = "fallback",
    },
    formatters_by_ft = {}
  },
  event = "BufReadPost"
}