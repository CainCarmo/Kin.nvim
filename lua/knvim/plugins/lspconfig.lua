return {
  "neovim/nvim-lspconfig",
  opts = {},
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
  },
}
