return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  keys = {
    { "<leader>;", "<cmd>Dashboard<CR>", desc = "Open Dashboard", mode = { "n", "v" } }
  },
  opts = function()
    local function button(txt, action, icon, key)
      return {
        desc       = " " .. txt .. string.rep(" ", 43 - #txt),
        action     = action,
        icon       = icon .. " ",
        key        = key,
        key_format = " %s"
      }
    end

    local config = {
      theme  = "doom",
      hide   = { statusline = true },
      config = {
        header = vim.split(
          string.rep("\n", 3)
          .. table.concat(ascii.headers.knvim, "\n")
          .. string.rep("\n", 2), "\n"
        ),
        center = {
          button(
            "New File",
            "ene | startinsert",
            icons.ui.NewFile,
            "n"
          ),
          button(
            "Find Files",
            "Telescope find_files",
            icons.ui.FindFile,
            "f"
          ),
          button(
            "Recent Files",
            "Telescope oldfiles",
            icons.ui.History,
            "r"
          ),
          button(
            "Lazy",
            "Lazy",
            icons.ui.List,
            "l"
          ),
          button(
            "Configuration",
            "e ~/.config/nvim/init.lua",
            icons.ui.Gear,
            "c"
          ),
          button(
            "Restore Session",
            "lua require('persistence').load()",
            icons.ui.Forward,
            "p"
          ),
          button(
            "Quit",
            function() vim.api.nvim_input("<cmd>qa<cr>") end,
            icons.ui.SignOut,
            "q"
          ),
        },
        footer = function()
          local st = require("lazy").stats()
          local ms = (math.floor(st.startuptime * 100 + 0.5) / 100)

          return { "📦 Kin.nvim loaded " .. st.loaded .. "/" .. st.count .. " plugins in " .. ms .. "ms" }
        end
      }
    }

    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(
            function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end
          )
        end
      })
    end

    return config
  end
}