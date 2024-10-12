return {
  "numToStr/Comment.nvim",
  lazy = true,
  keys = {
    { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment", mode = "n" },
    { "<leader>/", "<Plug>(comment_toggle_linewise_visual)",  desc = "Comment", mode = "v" }
  },
  dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
  config = function()
    require("Comment").setup {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
    }
  end
}