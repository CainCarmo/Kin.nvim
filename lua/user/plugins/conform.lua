return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 200,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      c = { "clangd_format" },
      go = { "gci", "gofumpt", "goimports", "goimports-reviser", "golines" },
      asm = { "asmfmt" },
      cpp = { "clangd_format" },
      css = { "stylelint" },
      jsx = { "eslint_d", "prettier", "prettierd" },
      php = { "phpcbf" },
      tsx = { "biome", "biome-check" },
      sql = { "sqlfmt" },
      html = { "htmlbeautifier" },
      rust = { "rustfmt" },
      yaml = { "yamlfmt" },
      python = { "autoflake", "autopep8", "black", "docformatter", "ruff_fix", "ruff_format", "ruff_organize_imports" },
      javascript = { "eslint_d", "prettier", "prettierd" },
      typescript = { "biome", "biome-check" }
    }
  },
  event = "BufReadPost"
}