return {
  "echasnovski/mini.surround",
  lazy = true,
  keys = {
    {
      "<leader>as",
      function()
        require("lazy").load("mini.surround")
      end,
      desc = "Active surround",
      mode = { "n", "v" }
    }
  },
  opts = {},
  version = "*"
}