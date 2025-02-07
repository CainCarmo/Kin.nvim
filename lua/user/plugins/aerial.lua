return {
  "stevearc/aerial.nvim",
  keys = {
    {
      "<leader>ls",
      function()
        require("aerial").toggle()
      end,
      desc = "Symbols Outline",
      mode = { "n", "v" },
    },
  },
  opts = {
    show_guides = true,
    filter_kind = false,
    attach_mode = "global",
    guides = {
      mid_item = "├ ",
      last_item = "└ ",
      nested_top = "│ ",
      whitespace = "  ",
    },
    layout = { min_width = 28 },
    backends = { "lsp", "treesitter", "markdown", "man" },
  },
}
