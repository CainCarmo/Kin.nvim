return {
  "kristijanhusak/vim-dadbod-ui",
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIFindBuffer",
    "DBUIAddConnection"
  },
  keys = {
    { "<leader>du", "<cmd>DBUI<CR>",              desc = "Open",           mode = { "n", "v" } },
    { "<leader>dt", "<cmd>DBUIToggle<CR>",        desc = "Toggle",         mode = { "n", "v" } },
    { "<leader>df", "<cmd>DBUIFindBuffer<CR>",    desc = "Find buffer",    mode = { "n", "v" } },
    { "<leader>da", "<cmd>DBUIAddConnection<CR>", desc = "Add connection", mode = { "n", "v" } }
  },
  lazy = true,
  dependencies = "tpope/vim-dadbod",
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end
}