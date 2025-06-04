return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      section_separators = "",
      component_separators = "",
      theme = {
        normal = {
          c = { fg = colors["min-theme"].dark.fg1, bg = colors["min-theme"].dark.bg0 },
        },
        inactive = {
          c = { fg = colors["min-theme"].dark.fg1, bg = colors["min-theme"].dark.bg0 },
        },
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
    local helpers = {}
    local theme = colors["min-theme"].dark

    helpers.sections = {
      ins_left = function(component)
        table.insert(opts.sections.lualine_c, component)
      end,
      ins_right = function(component)
        table.insert(opts.sections.lualine_x, component)
      end,
    }

    helpers.conditions = {
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

    --> Left
    helpers.sections.ins_left {
      function()
        return string.upper(vim.fn.mode())
      end,
      color = { bg = theme.fg1, fg = theme.bg1, gui = "bold" },
    }

    helpers.sections.ins_left {
      "branch",
      icon = icons.git.Branch,
      color = { bg = theme.bg1, fg = theme.purple },
    }

    helpers.sections.ins_left {
      "diagnostics",
      cond = helpers.conditions.hide_in_width,
      color = { bg = theme.bg1 },
      sources = { "nvim_lsp", "nvim_diagnostic" },
      symbols = {
        info = icons.diagnostics.BoldInformation .. " ",
        warn = icons.diagnostics.BoldWarning .. " ",
        error = icons.diagnostics.BoldError .. " ",
      },
      diagnostics_color = {
        color_info = { fg = theme.blue },
        color_warn = { fg = theme.orange },
        color_error = { fg = theme.red },
      },
    }

    helpers.sections.ins_left {
      "filename",
      path = 1,
      file_status = true,
      newfile_status = true,
      cond = helpers.conditions.hide_in_width and helpers.conditions.buffer_not_empty,
      color = { fg = theme.fg3 },
    }

    helpers.sections.ins_left {
      "filesize",
      cond = helpers.conditions.hide_in_width and helpers.conditions.buffer_not_empty,
      color = { fg = theme.fg3 },
      padding = { left = -2 },
    }

    --> Right
    helpers.sections.ins_right {
      "searchcount",
      cond = helpers.conditions.hide_in_width,
      color = { fg = theme.orange },
    }

    helpers.sections.ins_right {
      "o:encoding",
      fmt = string.upper,
      color = { bg = theme.bg1, fg = theme.fg1, gui = "bold" },
    }

    helpers.sections.ins_right {
      function()
        local message = ""

        for _, client in ipairs(vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })) do
          if client.config.filetypes and vim.tbl_contains(client.config.filetypes, vim.bo.filetype) then
            return client.name
          end
        end

        return message
      end,
      cond = helpers.conditions.hide_in_width,
      icon = "",
      color = { bg = theme.bg1, fg = theme.purple },
    }

    helpers.sections.ins_right {
      "location",
      color = { bg = theme.fg1, fg = theme.bg1 },
    }

    helpers.sections.ins_right {
      "progress",
      color = { bg = theme.bg1, fg = theme.fg1 },
    }

    require("lualine").setup(opts)
  end,
}
