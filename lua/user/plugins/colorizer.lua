return {
  "NvChad/nvim-colorizer.lua",
  keys = {
    {
      "<leader>ac",
      function()
        require("lazy").load("nvim-colorizer.lua")
      end,
      desc = "Active colorizer",
      mode = { "n", "v" }
    }
  },
  lazy = true,
  opts = {
    user_default_options = {
      names = false,
      rgb_fn = true,
      hsl_fn = true
    }
  }
}