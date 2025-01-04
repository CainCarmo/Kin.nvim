return {
  "lewis6991/gitsigns.nvim",
  cmd = "Gitsigns",
  keys = {
    {
      "<leader>gj",
      "<cmd>lua require('gitsigns').next_hunk({navigation_message = false})<cr>",
      desc = "Next Hunk",
      mode = { "n", "v" }
    },
    {
      "<leader>gk",
      "<cmd>lua require('gitsigns').prev_hunk({navigation_message = false})<cr>",
      desc = "Prev Hunk",
      mode = { "n", "v" }
    },
    {
      "<leader>gp",
      "<cmd>lua require('gitsigns').preview_hunk()<cr>",
      desc = "Preview Hunk",
      mode = { "n", "v" }
    },
    {
      "<leader>gr",
      "<cmd>lua require('gitsigns').reset_hunk()<cr>",
      desc = "Reset Hunk",
      mode = { "n", "v" }
    },
    {
      "<leader>gl",
      "<cmd>lua require('gitsigns').blame_line()<cr>",
      desc = "Blame",
      mode = { "n", "v" }
    },
    {
      "<leader>gR",
      "<cmd>lua require('gitsigns').reset_buffer()<cr>",
      desc = "Reset Buffer",
      mode = { "n", "v" }
    },
    {
      "<leader>gs",
      "<cmd>lua require('gitsigns').stage_hunk()<cr>",
      desc = "Stage Hunk",
      mode = { "n", "v" }
    },
    {
      "<leader>gu",
      "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>",
      desc = "Undo Stage Hunk",
      mode = { "n", "v" }
    },
    {
      "<leader>gd",
      "<cmd>Gitsigns diffthis HEAD<cr>",
      desc = "Git Diff",
      mode = { "n", "v" }
    }
  },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    }
  },
  event = "VeryLazy"
}