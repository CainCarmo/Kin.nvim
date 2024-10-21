return {
  "IogaMaster/neocord",
  lazy = true,
  keys = {
    {
      "<leader>an",
      function()
        vim.cmd [[ Lazy load neocord ]]
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