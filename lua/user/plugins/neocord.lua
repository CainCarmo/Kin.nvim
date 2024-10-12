return {
  "IogaMaster/neocord",
  lazy = true,
  keys = {
    {
      "<leader>an",
      function()
        require("lazy").load("neocord")
      end,
      desc = "Active neocord",
      mode = { "n", "v" }
    }
  },
  opts = {
    logo = "https://i.imgur.com/gpcIEF4.png",
    global_timer = true
  }
}