return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTelescope" },
  keys = {
    { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
    { "]t",         function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" }
  },
  opts = {},
  event = "BufReadPost"
}