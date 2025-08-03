return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      tab_size = 20,
      close_icon = Icons.ui.BoldClose,
      modified_icon = Icons.git.FileUnstaged,
      buffer_close_icon = Icons.ui.Close,
      left_trunc_marker = Icons.ui.BoldArrowLeft,
      right_trunc_marker = Icons.ui.BoldArrowRight,
    },
  },
  event = "VeryLazy",
  version = "*",
  dependencies = "echasnovski/mini.icons",
}
