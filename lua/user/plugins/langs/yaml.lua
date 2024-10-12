return {
  "someone-stole-my-name/yaml-companion.nvim",
  ft = "yaml",
  keys = {
    { "<leader>ys", "<cmd>Telescope yaml_schema<CR>", desc = "Show yaml schemas", mode = { "n", "v" } }
  },
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    require("telescope").load_extension("yaml_schema")
  end
}