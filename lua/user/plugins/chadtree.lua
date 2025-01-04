return {
  "simonmclean/triptych.nvim",
  keys = {
    { "<leader>e", "<Cmd>Triptych<CR>", desc = "File Explorer", mode = { "n", "v" } }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "antosha417/nvim-lsp-file-operations",
    "saifulapm/neotree-file-nesting-config"
  },
  config = function(_, opts)
    opts.nesting_rules = require('neotree-file-nesting-config').nesting_rules
    require("triptych").setup(opts)
  end
}