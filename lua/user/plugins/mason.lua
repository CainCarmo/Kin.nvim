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
      ensure_installed = {
        "bashls",
        "clangd",
        "css_variables",
        "cssls",
        "cssmodules_ls",
        "tailwindcss",
        "docker_compose_language_service",
        "dockerls",
        "emmet_ls",
        "html",
        "htmx",
        "denols",
        "ts_ls",
        "jsonls",
        "lua_ls",
        "grammarly",
        "intelephense",
        "prismals",
        "pyright",
        "sqlls",
        "yamlls"
      },
      automatic_installation = { exclude = { "ruby_lsp", "rubocop" } },
    },
    event = "VeryLazy",
    dependencies = "williamboman/mason.nvim"
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "prettier",
        "eslint_d",
        "prettierd",
        "actionlint",
        "editorconfig-checker"
      }
    },
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }
  }
}