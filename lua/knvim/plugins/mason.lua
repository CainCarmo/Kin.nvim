return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = { border = "rounded" },
      max_concurrent_installers = 5,
    },
    event = "VeryLazy",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {},
    event = "VeryLazy",
    dependencies = "williamboman/mason.nvim",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {},
    event = "VeryLazy",
    dependencies = "williamboman/mason.nvim",
  },
}
