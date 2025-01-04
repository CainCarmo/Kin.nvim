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
        "chadtree",
        "dashboard",
        "lazy",
        "mason",
        "notify"
      }
    }
  },
  event = "BufReadPost"
}