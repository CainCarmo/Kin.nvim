return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  keys = {
    {
      "<leader>b",
      function()
        require("barbecue.ui").toggle()
      end,
      desc = "Toggle bar",
      mode = { "n", "v" }
    }
  },
  opts = {
    create_autocmd = true
  },
  event = "BufReadPre",
  version = "*",
  dependencies = "SmiteshP/nvim-navic"
}