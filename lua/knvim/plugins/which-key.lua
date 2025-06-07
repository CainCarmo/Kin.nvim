return {
  "folke/which-key.nvim",
  keys = {},
  opts = {
    spec = {
      mode = { "n", "v" },
      { "<leader>a", group = "Active Plugins" },
      { "<leader>d", group = "Debugger" },
      { "<leader>f", group = "Search" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "Lsp" },
      { "<leader>n", group = "Noice" },
      { "<leader>s", group = "Sessions" },
    },
    win = {
      no_overlap = true,
      padding = { 2, 2, 2, 2 },
      title = true,
      title_pos = "center",
      zindex = 1000,
      bo = {},
      wo = {},
    },
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
    preset = "modern",
  },
  event = "VeryLazy",
}
