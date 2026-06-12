return {
  "nvim-tree/nvim-tree.lua",
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
        "Dockerfile",
        "package.json",
        "package-lock.json",
        "tsconfig.json",
        "composer.json",
        "composer.lock",
        "requirements.txt",
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
