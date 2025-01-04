return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
      max_concurrent_installers = 5
    },
    event = "VeryLazy",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls" },
      automatic_installation = { exclude = { "ruby_lsp", "rubocop" } },
    },
    event = "VeryLazy",
    dependencies = "williamboman/mason.nvim"
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      ensure_installed = { "editorconfig-checker" }
    },
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }
  }
}