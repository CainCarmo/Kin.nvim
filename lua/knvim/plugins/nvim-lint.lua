return {
  "mfussenegger/nvim-lint",
  opts = {},
  event = { "BufReadPost", "BufNewFile" },
  config = function(_, opts)
    local lint = require("lint")
    local lint_augroup = vim.api.nvim_create_augroup("nvim_lint", { clear = true })

    lint.linters_by_ft = opts.linters_by_ft

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint(nil, { ignore_exitcode = true })
      end,
    })
  end,
}
