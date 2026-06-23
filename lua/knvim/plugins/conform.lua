return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 200,
      lsp_format = "fallback",
    },
  },
  event = { "BufReadPre", "BufNewFile" },
}
