return {
  "folke/which-key.nvim",
  keys = {},
  opts = {
    preset = "modern",
    plugins = {
      marks = false,
      regsiters = false,
    },
    win = {
      padding = { 2, 2 },
    },
    disable = {
      bt = { "TelescopePrompt" },
    },
  },
  event = "VeryLazy",
}
