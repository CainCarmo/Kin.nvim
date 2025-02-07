return {
  "folke/which-key.nvim",
  keys = {},
  opts = {
    spec = {
      mode = { "n", "v" },
      { "<leader>a", group = "Active Plugins" },
      { "<leader>b", group = "Winbar" },
      { "<leader>d", group = "Debugger" },
      { "<leader>f", group = "Search" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "Lsp" },
      { "<leader>n", group = "Notes" },
      { "<leader>N", group = "Noice" },
      { "<leader>s", group = "Sessions" },
      { "<leader>w", group = "Web Development" },
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
