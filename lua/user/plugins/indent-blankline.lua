return {
  "lukas-reineke/indent-blankline.nvim",
  name = "ibl",
  opts = {
    indent  = { char = "│", tab_char = "│" },
    scope   = { show_start = false, show_end = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "lazy",
        "mason",
        "notify",
        "lazyterm",
      }
    }
  },
  event = "BufReadPost"
}