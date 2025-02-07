return {
  "simonmclean/triptych.nvim",
  keys = {
    { "<leader>e", "<cmd>Triptych<CR>", desc = "Toggle View", mode = { "n", "v" } },
  },
  opts = {
    options = {
      show_hidden = true,
    },
    extension_mappings = {
      ["<C-f>"] = {
        mode = { "n", "v" },
        fn = function(target, _)
          require "telescope.builtin".live_grep {
            search_dirs = { target.path },
          }
        end,
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.icons",
    "antosha417/nvim-lsp-file-operations",
    "saifulapm/neotree-file-nesting-config",
  },
  config = function(_, opts)
    opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules

    require("triptych").setup(opts)
  end,
}
