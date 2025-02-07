return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      ["*"] = { "editorconfig-checker" },
    },
  },
  event = "BufReadPost",
  config = function(_, opts)
    local lint = require "lint"
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    lint.linters_by_ft = table.merge(knvim.langs.linter.names, opts.linters_by_ft)

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint(nil, { ignore_errors = true })
      end,
    })
  end,
}
