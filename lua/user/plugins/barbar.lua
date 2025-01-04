return {
  "romgrk/barbar.nvim",
  keys = {
    -- Move to previous/next
    { "<TAB>", "<Cmd>BufferNext<CR>",         desc = "Move to next tab",                  mode = { "n", "v" } },
    { "<A-,>", "<Cmd>BufferPrevious<CR>",     desc = "Move to previous tab",              mode = { "n", "v" } },
    -- Re-order to previous/next
    { "<A->>", "<Cmd>BufferMoveNext<CR>",     desc = "Send to tab for next position",     mode = { "n", "v" } },
    { "<A-<>", "<Cmd>BufferMovePrevious<CR>", desc = "Send to tab for previous position", mode = { "n", "v" } },
    -- Goto buffer in position...
    { "<A-1>", "<Cmd>BufferGoto 1<CR>",       desc = "Goto buffer in position 1",         mode = { "n", "v" } },
    { "<A-2>", "<Cmd>BufferGoto 2<CR>",       desc = "Goto buffer in position 2",         mode = { "n", "v" } },
    { "<A-3>", "<Cmd>BufferGoto 3<CR>",       desc = "Goto buffer in position 3",         mode = { "n", "v" } },
    { "<A-4>", "<Cmd>BufferGoto 4<CR>",       desc = "Goto buffer in position 4",         mode = { "n", "v" } },
    { "<A-5>", "<Cmd>BufferGoto 5<CR>",       desc = "Goto buffer in position 5",         mode = { "n", "v" } },
    { "<A-6>", "<Cmd>BufferGoto 6<CR>",       desc = "Goto buffer in position 6",         mode = { "n", "v" } },
    { "<A-7>", "<Cmd>BufferGoto 7<CR>",       desc = "Goto buffer in position 7",         mode = { "n", "v" } },
    { "<A-8>", "<Cmd>BufferGoto 8<CR>",       desc = "Goto buffer in position 8",         mode = { "n", "v" } },
    { "<A-9>", "<Cmd>BufferGoto 9<CR>",       desc = "Goto buffer in position 0",         mode = { "n", "v" } },
    { "<A-0>", "<Cmd>BufferLast<CR>",         desc = "Goto a last buffer",                mode = { "n", "v" } },
    -- Pin/unpin buffer
    { "<A-p>", "<Cmd>BufferPin<CR>",          desc = "Pin/unpin buffer",                  mode = { "n", "v" } },
    -- Close buffer
    { "<A-c>", "<Cmd>BufferClose<CR>",        desc = "Close buffer",                      mode = { "n", "v" } },
  },
  event = "VeryLazy",
  init = function()
    vim.g.barbar_auto_setup = true
  end
}