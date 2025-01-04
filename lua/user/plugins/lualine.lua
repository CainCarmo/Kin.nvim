-- TODO: change style
return {
  "nvim-lualine/lualine.nvim",
  event = "BufReadPre",
  config = function()
    local utils      = {}

    utils.colors     = {
      bg         = "#202328",
      fg         = { light = "#F5EDED", dark = "#0F0F0F" },
      red        = "#ec5f67",
      blue       = "#51afef",
      cyan       = "#008080",
      gold       = "#E7D37F",
      green      = "#87A922",
      orange     = "#FF8800",
      violet     = "#a9a1e1",
      yellow     = "#ECBE7B",
      magenta    = "#c678dd",
      darkgrey   = "#373A40",
      darkgreen  = "#365E32",
      lightgreen = "#98be65"
    }

    local config     = {
      options = {
        section_separators = "",
        component_separators = "",
        theme = {
          normal = { c = { fg = utils.colors.fg.light, bg = utils.colors.bg } },
          inactive = { c = { fg = utils.colors.fg.light, bg = utils.colors.bg } }
        }
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_y = {},
        lualine_x = {},
        lualine_z = {}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_y = {},
        lualine_x = {},
        lualine_z = {}
      }
    }

    utils.sections   = {
      ins_left = function(component)
        table.insert(config.sections.lualine_c, component)
      end,
      ins_right = function(component)
        table.insert(config.sections.lualine_x, component)
      end,
    }

    utils.conditions = {
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
      end
    }

    utils.sections.ins_left {
      function()
        return "▊"
      end,
      color = { bg = utils.colors.darkgrey, fg = utils.colors.green },
      padding = { left = 0, right = 1 }
    }
    utils.sections.ins_left {
      function()
        return icons.chars.fire
      end,
      color = function()
        local modes = {
          n      = utils.colors.red,
          i      = utils.colors.lightgreen,
          v      = utils.colors.blue,
          t      = utils.colors.red,
          c      = utils.colors.magenta,
          V      = utils.colors.blue,
          s      = utils.colors.orange,
          S      = utils.colors.orange,
          r      = utils.colors.cyan,
          R      = utils.colors.violet,
          no     = utils.colors.red,
          ic     = utils.colors.yellow,
          cv     = utils.colors.red,
          ce     = utils.colors.red,
          rm     = utils.colors.cyan,
          Rv     = utils.colors.violet,
          ["!"]  = utils.colors.red,
          [""]  = utils.colors.blue,
          [""]  = utils.colors.orange,
          ["r?"] = utils.colors.cyan,
        }

        return { bg = utils.colors.darkgrey, fg = modes[vim.fn.mode()] }
      end,
      padding = { right = 1 }
    }
    utils.sections.ins_left {
      function()
        return icons.misc.Robot .. "Kin.nvim"
      end,
      separator = { right = "" },
      color = { bg = utils.colors.darkgrey, fg = utils.colors.magenta, gui = "bold" }
    }
    utils.sections.ins_left {
      "branch",
      icon = icons.git.Branch,
      color = { bg = utils.colors.darkgreen, fg = utils.colors.gold, gui = "bold" },
      separator = { right = "" }
    }
    utils.sections.ins_left {
      "diagnostics",
      cond = utils.conditions.hide_in_width,
      sources = { "nvim_lsp", "nvim_diagnostic" },
      symbols = { info = " ", warn = " ", error = " " },
      diagnostics_color = {
        color_info = { fg = utils.colors.cyan },
        color_warn = { fg = utils.colors.yellow },
        color_error = { fg = utils.colors.red }
      }
    }

    utils.sections.ins_left {
      function()
        return "%="
      end
    }

    utils.sections.ins_left {
      "filetype",
      icon_only = true,
      separator = { left = "" },
      color = { bg = utils.colors.darkgrey },
      cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty
    }
    utils.sections.ins_left {
      "filename",
      path = 4,
      file_status = true,
      newfile_status = true,
      color = { bg = utils.colors.darkgrey },
      separator = { left = "", right = "" },
      cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty
    }
    utils.sections.ins_left {
      "filesize",
      separator = { right = "" },
      color = { bg = utils.colors.darkgrey, fg = utils.colors.magenta },
      cond = utils.conditions.hide_in_width or utils.conditions.buffer_not_empty
    }

    utils.sections.ins_right {
      "searchcount",
      cond = utils.conditions.hide_in_width,
      color = { fg = utils.colors.magenta }
    }
    utils.sections.ins_right {
      "o:encoding",
      fmt = string.upper,
      separator = { left = "" },
      color = { bg = utils.colors.darkgrey, fg = utils.colors.lightgreen, gui = "bold" },
    }
    utils.sections.ins_right {
      function()
        local message = ""
        local clients = vim.lsp.get_active_clients()
        local buf_ft  = vim.api.nvim_buf_get_option(0, 'filetype')

        if next(clients) == nil then return message end

        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end

        return message
      end,
      cond = utils.conditions.hide_in_width,
      icon = "",
      color = { bg = utils.colors.darkgrey, fg = utils.colors.blue }
    }
    utils.sections.ins_right {
      "location",
      separator = { left = "" },
      color = { bg = utils.colors.green, fg = utils.colors.fg.dark, gui = "bold" },
    }
    utils.sections.ins_right {
      "progress",
      color = { bg = utils.colors.darkgrey, fg = utils.colors.lightgreen, gui = "bold" },
    }

    require("lualine").setup(config)
  end
}