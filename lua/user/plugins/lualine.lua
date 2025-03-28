return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      section_separators = "",
      component_separators = "",
      theme = {
        normal = { c = { fg = "", bg = "" } },
        inactive = { c = { fg = "", bg = "" } },
      },
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_y = {},
      lualine_x = {},
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_y = {},
      lualine_x = {},
      lualine_z = {},
    },
  },
  event = "VeryLazy",
  config = function(_, opts)
    local helper = {}

    helper.colors = {}
    helper.colors.bg = "504945"
    helper.colors.fg = "ebdbb2"
    helper.colors.white = "fbf1c7"
    helper.colors.black = "3c3836"

    helper.colors.light = {}
    helper.colors.light.red = "fb4934"
    helper.colors.light.grey = "a89984"
    helper.colors.light.aqua = "8ec07c"
    helper.colors.light.blue = "83a598"
    helper.colors.light.green = "b8bb26"
    helper.colors.light.yellow = "fabd2f"
    helper.colors.light.purple = "d3869b"
    helper.colors.light.orange = "fe8019"

    helper.colors.dark = {}
    helper.colors.dark.red = "cc241d"
    helper.colors.dark.grey = "928374"
    helper.colors.dark.aqua = "689d6a"
    helper.colors.dark.blue = "458588"
    helper.colors.dark.green = "98971a"
    helper.colors.dark.yellow = "d79921"
    helper.colors.dark.purple = "b16286"
    helper.colors.dark.orange = "d65d0e"

    opts.options.theme.normal = {
      c = { fg = helper.colors.fg, bg = helper.colors.bg },
    }
    opts.options.theme.inactive = {
      c = { fg = helper.colors.fg, bg = helper.colors.bg },
    }

    opts.sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }
    opts.inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }

    helper.sections = {
      ins_left = function(component)
        table.insert(opts.sections.lualine_c, component)
      end,
      ins_right = function(component)
        table.insert(opts.sections.lualine_x, component)
      end,
    }

    helper.conditions = {
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand "%:t") ~= 1
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand "%:p:h"
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    --> Left side
    helper.sections.ins_left {
      function()
        return "▊"
      end,
      color = { bg = helper.colors.black, fg = helper.colors.light.green },
      padding = { left = 0, right = 1 },
    }

    helper.sections.ins_left {
      function()
        return icons.chars.k
      end,
      color = function()
        local modes = {
          n = helper.colors.dark.red,
          t = helper.colors.dark.red,
          v = helper.colors.light.blue,
          V = helper.colors.light.blue,
          r = helper.colors.light.cyan,
          i = helper.colors.light.green,
          s = helper.colors.light.orange,
          S = helper.colors.light.orange,
          R = helper.colors.light.violet,
          c = helper.colors.light.magenta,
          no = helper.colors.light.red,
          cv = helper.colors.light.red,
          ce = helper.colors.light.red,
          rm = helper.colors.light.cyan,
          Rv = helper.colors.light.violet,
          ic = helper.colors.light.yellow,
          ["!"] = helper.colors.light.red,
          [""] = helper.colors.light.blue,
          [""] = helper.colors.light.orange,
          ["r?"] = helper.colors.light.cyan,
        }

        return { bg = helper.colors.black, fg = modes[vim.fn.mode()] }
      end,
      padding = { right = 1 },
    }

    helper.sections.ins_left {
      function()
        return "Kin.nvim"
      end,
      separator = { right = "" },
      color = { bg = helper.colors.black, fg = helper.colors.dark.green, gui = "bold" },
    }

    helper.sections.ins_left {
      "branch",
      icon = icons.git.Branch,
      color = { bg = helper.colors.dark.green, fg = helper.colors.black, gui = "bold" },
      separator = { right = "" },
    }

    helper.sections.ins_left {
      "diagnostics",
      cond = helper.conditions.hide_in_width,
      sources = { "nvim_lsp", "nvim_diagnostic" },
      symbols = { info = " ", warn = " ", error = " " },
      diagnostics_color = {
        color_info = { fg = helper.colors.light.cyan },
        color_warn = { fg = helper.colors.light.yellow },
        color_error = { fg = helper.colors.light.red },
      },
    }

    --> Separator
    helper.sections.ins_left {
      function()
        return "%="
      end,
    }

    --> Center side
    helper.sections.ins_left {
      "filetype",
      icon_only = true,
      separator = { left = "" },
      color = { bg = helper.colors.black },
      cond = helper.conditions.hide_in_width or helper.conditions.buffer_not_empty,
    }

    helper.sections.ins_left {
      "filename",
      path = 4,
      file_status = true,
      newfile_status = true,
      color = { bg = helper.colors.black },
      separator = { left = "", right = "" },
      cond = helper.conditions.hide_in_width or helper.conditions.buffer_not_empty,
    }

    helper.sections.ins_left {
      "filesize",
      separator = { right = "" },
      color = { bg = helper.colors.black, fg = helper.colors.dark.green },
      cond = helper.conditions.hide_in_width or helper.conditions.buffer_not_empty,
    }

    --> Right side
    helper.sections.ins_right {
      "searchcount",
      cond = helper.conditions.hide_in_width,
      color = { fg = helper.colors.purple },
    }

    helper.sections.ins_right {
      "o:encoding",
      fmt = string.upper,
      separator = { left = "" },
      color = { bg = helper.colors.black, fg = helper.colors.light.green, gui = "bold" },
    }

    helper.sections.ins_right {
      function()
        local message = ""

        for _, client in ipairs(vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })) do
          if client.config.filetypes and vim.tbl_contains(client.config.filetypes, vim.bo.filetype) then
            return client.name
          end
        end

        return message
      end,
      cond = helper.conditions.hide_in_width,
      icon = "",
      color = { bg = helper.colors.black, fg = helper.colors.light.blue },
    }

    helper.sections.ins_right {
      "location",
      separator = { left = "" },
      color = { bg = helper.colors.dark.green, fg = helper.colors.black, gui = "bold" },
    }

    helper.sections.ins_right {
      "progress",
      color = { bg = helper.colors.black, fg = helper.colors.dark.green, gui = "bold" },
    }

    require("lualine").setup(opts)
  end,
}
