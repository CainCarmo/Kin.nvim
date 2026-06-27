return {
  "rcarriga/nvim-notify",
  opts = {
    fps = 60,
    stages = "static",
    render = "compact",
    timeout = 1500,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
}
