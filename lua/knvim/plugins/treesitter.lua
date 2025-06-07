return {
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSUpdate", "TSUninstall", "TSUpdateSync" },
    opts = {
      indent = { enabled = true },
      highlight = { enabled = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          scope_incremental = false,
          node_decremental = "<bs>",
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
        },
      },
    },
    build = ":TSUpdate",
    event = "VeryLazy",
    version = false,
    dependencies = "rcarriga/nvim-notify",
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    config = function(_, opts)
      opts.ensure_installed = table.merge(Knvim.langs.treesitter, {
        "bash",
        "editorconfig",
        "json",
        "lua",
        "toml",
        "yaml",
      })

      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = { enable_autocmd = false },
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    cmd = {
      "TSContextEnable",
      "TSContextToggle",
      "TSContextDisable",
    },
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
}
