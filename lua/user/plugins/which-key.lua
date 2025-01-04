return {
  "folke/which-key.nvim",
  keys = {},
  opts = {
    spec = {
      mode = { "n", "v" },
      { "<leader>a", group = "Active Plugins" },
      { "<leader>b", group = "Barbucue" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "Lsp" },
      { "<leader>L", group = "Live Server" },
      { "<leader>m", group = "Multi Cursor" },
      { "<leader>M", group = "Markdown Preview" },
      { "<leader>n", group = "Noice" },
      { "<leader>q", group = "Quit" },
      { "<leader>f", group = "Telescope" },
      { "<leader>s", group = "Todo Comments" },
      { "<leader>y", group = "Yaml" }
    },
    win = {
      no_overlap = true,
      padding = { 2, 2, 2, 2 },
      title = true,
      title_pos = "center",
      zindex = 1000,
      bo = {},
      wo = {}
    },
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" }
    },
    preset = "modern"
  },
  event = "VeryLazy",
}