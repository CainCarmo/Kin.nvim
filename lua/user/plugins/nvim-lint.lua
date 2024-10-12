return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      ["*"] = { "editorconfig-checker" },
      c = { "cpplint" },
      js = { "eslint", "eslint_d" },
      ts = { "biomejs" },
      cpp = { "cpplint" },
      css = { "stylelint" },
      jsx = { "eslint", "eslint_d" },
      lua = { "luacheck" },
      tsx = { "biomejs" },
      php = { "phpcs", "php" },
      html = { "htmlhint" },
      json = { "jsonlint" },
      yaml = { "yamllint", "actionlint" },
      prisma = { "prisma-lint" },
      python = { "flake8", "mypy", "ruff" }
    }
  },
  event = "BufReadPost",
  config = function(_, opts)
    local lint = require "lint"
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    lint.linters_by_ft = opts.linters_by_ft

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint(nil, { ignore_errors = true })
      end
    })
  end
}