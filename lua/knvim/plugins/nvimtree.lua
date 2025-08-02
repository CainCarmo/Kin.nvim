return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Filetree", mode = { "n", "v" } },
  },
  opts = {
    sort = {
      sorter = "name",
    },
    view = {
      side = "right",
      width = 40,
    },
    filters = {
      enable = false,
    },
    renderer = {
      special_files = {
        "README.md",
        "LICENSE.md",
        "Makefile",
        "Cargo.toml",
        "package.json",
        "tsconfig.json",
      },
      icons = {
        web_devicons = {
          folder = { enable = true },
        },
      },
    },
  },
  event = "VeryLazy",
}
