return {
  "folke/noice.nvim",
  keys = {
    {
      "<leader>nl",
      function() require("noice").cmd("last") end,
      desc = "Noice Last Message"
    },
    {
      "<leader>nh",
      function() require("noice").cmd("history") end,
      desc = "Noice History"
    },
    {
      "<leader>na",
      function() require("noice").cmd("all") end,
      desc = "Noice All"
    },
    {
      "<leader>nd",
      function() require("noice").cmd("dismiss") end,
      desc = "Dismiss All"
    },
    {
      "<leader>nt",
      function() require("noice").cmd("pick") end,
      desc = "Noice Picker (Telescope/FzfLua)"
    },
    {
      "<S-Enter>",
      function() require("noice").redirect(vim.fn.getcmdline()) end,
      mode = "c",
      desc = "Redirect Cmdline"
    },
    {
      "<C-f>",
      function() if not require("noice.lsp").scroll(4) then return "<C-f>" end end,
      expr = true,
      silent = true,
      desc = "Scroll Forward",
      mode = { "i", "n", "s" }
    },
    {
      "<C-b>",
      function() if not require("noice.lsp").scroll(-4) then return "<C-b>" end end,
      expr = true,
      silent = true,
      desc = "Scroll Backward",
      mode = { "i", "n", "s" }
    },
  },
  opts = {
    lsp = {
      override = {
        ["cmp.entry.get_documentation"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true
      }
    },
    routes = {
      {
        view = "mini",
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" }
          }
        }
      }
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    }
  },
  event = "VeryLazy",
  version = "4.4.7",
  config = function(_, opts)
    if vim.o.filetype == "lazy" then
      vim.cmd([[messages clear]])
    end

    require("noice").setup(opts)
  end
}