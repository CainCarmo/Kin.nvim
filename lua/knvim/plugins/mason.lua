return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
      max_concurrent_installers = 5,
    },
    event = "VeryLazy",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = table.merge(Knvim.langs.lsp.names, {
        "jsonls",
        "lua_ls",
        "yamlls",
      }),
    },
    event = "VeryLazy",
    dependencies = "williamboman/mason.nvim",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      ensure_installed = table.merge(Knvim.langs.lsp.tools, { "editorconfig-checker" }),
    },
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  },
}
