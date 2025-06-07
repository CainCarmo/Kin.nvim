return {
  "IogaMaster/neocord",
  keys = {
    {
      "<leader>an",
      function()
        vim.cmd [[ Lazy load neocord ]]
      end,
      desc = "Neocord",
      mode = { "n", "v" },
    },
  },
  opts = {
    logo = "https://i.imgur.com/gpcIEF4.png",
    global_timer = true,
  },
}
