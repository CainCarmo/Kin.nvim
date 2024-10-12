return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    keys = {
      {
        "<leader>fc",
        "<cmd>Telescope colorscheme<CR>",
        desc = "Colorscheme"
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers previewer=true<cr>",
        desc = "Find"
      },
      {
        "<leader>fg",
        "<cmd>Telescope git_branches<cr>",
        desc = "Checkout branch"
      },
      {
        "<leader>fs",
        "<cmd>Telescope git_status<CR>",
        desc = "Status"
      },
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find files"
      },
      {
        "<leader>ft",
        "<cmd>Telescope live_grep<cr>",
        desc = "Find Text"
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Help"
      },
      {
        "<leader>fl",
        "<cmd>Telescope resume<cr>",
        desc = "Last Search"
      },
      {
        "<leader>fr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent File"
      },
      {
        "<leader>fn",
        function()
          require("telescope").extensions.notify.notify()
        end,
        desc = "Open all notifications"
      },
      {
        "<leader>fd",
        function()
          require("notify").dismiss { silent = true, pending = true }
        end,
        desc = "Dismiss all notifications"
      }
    },
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require "telescope.actions"

      require("telescope").setup {
        defaults = {
          prompt_prefix = icons.ui.Telescope .. " ",
          selection_caret = icons.ui.Forward .. " ",
          entry_prefix = "   ",
          initial_mode = "insert",
          selection_strategy = "reset",
          path_display = { "smart" },
          color_devicons = true,
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/"
          },
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,

              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous
            },
            n = {
              ["<esc>"] = actions.close,
              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["q"] = actions.close
            },
          },
        },
        pickers = {
          live_grep = {
            theme = "dropdown"
          },
          grep_string = {
            theme = "dropdown"
          },
          find_files = {
            theme = "dropdown",
            previewer = true
          },
          buffers = {
            theme = "dropdown",
            previewer = true,
            initial_mode = "normal",
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer
              },
              n = {
                ["dd"] = actions.delete_buffer
              }
            }
          },
          planets = {
            show_moon = true,
            show_pluto = true
          },
          colorscheme = {
            enable_preview = true
          },
          lsp_references = {
            theme = "dropdown",
            initial_mode = "normal"
          },
          lsp_definitions = {
            theme = "dropdown",
            initial_mode = "normal"
          },
          lsp_declarations = {
            theme = "dropdown",
            initial_mode = "normal"
          },
          lsp_implementations = {
            theme = "dropdown",
            initial_mode = "normal"
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }
    end
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = true,
    build = "make"
  }
}