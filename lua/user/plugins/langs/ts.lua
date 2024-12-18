return {
  {
    "dmmulroy/tsc.nvim",
    ft = { "typescript", "tsx" },
    opts = {
      use_trouble_qflist = true,
      auto_start_watch_mode = true,
    }
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "tsx" },
    opts = {}
  },
  {
    "barrett-ruth/import-cost.nvim",
    ft = { "typescript", "tsx" },
    opts = {},
    build = "sh install.sh npm"
  }
}