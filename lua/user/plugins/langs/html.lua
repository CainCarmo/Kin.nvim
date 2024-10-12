return {
  "ngtuonghy/live-server-nvim",
  ft = "html",
  cmd = {
    "LiveServerStop",
    "LiveServerStart",
    "LiveServerToggle",
    "LiveServerStart -f"
  },
  keys = {
    {
      "<leader>Lt",
      function() require("live-server-nvim").toggle() end,
      desc = "Live server toggle",
      mode = { "n", "v" }
    }
  },
  opts = {},
  build = ":LiveServerInstall",
}