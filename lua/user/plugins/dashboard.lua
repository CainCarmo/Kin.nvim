return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  keys = {
    { "<leader>;", "<cmd>Dashboard<CR>", desc = "Dashboard", mode = { "n", "v" } },
  },
  opts = function()
    local setup = {}

    local function button(desc, action, icon, key)
      return {
        desc = " " .. desc .. string.rep(" ", 43 - #desc),
        action = action,
        icon = icon:gsub(" ", "") .. " ",
        key = key,
        key_format = " %s",
      }
    end

    setup.theme = "doom"
    setup.hide = { statusline = false }
    setup.config = {
      header = vim.split(string.rep("\n", 3) .. table.concat(knvim.startup.header, "\n") .. string.rep("\n", 2), "\n"),
      center = {
        button("New File", "ene | startinsert", icons.ui.NewFile, "n"),
        button("Find File", function()
          vim.cmd [[ Lazy load telescope.nvim ]]
          vim.cmd [[ Telescope find_files ]]
        end, icons.ui.FindFile, "f"),
        button("Find Word", function()
          vim.cmd [[ Lazy load telescope.nvim ]]
          vim.cmd [[ Telescope live_grep ]]
        end, icons.ui.FindText, "w"),
        button("Recent Files", function()
          vim.cmd [[ Lazy load telescope.nvim ]]
          vim.cmd [[ Telescope oldfiles ]]
        end, icons.ui.History, "r"),
        button("Recent Sessions", "lua require('persistence').select()", icons.ui.Scopes, "s"),
        button("Restore Sessions", "lua require('persistence').load()", icons.ui.Forward, "S"),
        button("Configuration", "e " .. vim.fn.stdpath("config") .. "/init.lua", icons.ui.Gear, "c"),
        button("Quit", function()
          require("persistence").stop()
          vim.cmd [[ qa ]]
        end, icons.ui.SignOut, "q"),
      },
      footer = function()
        local st = require("lazy").stats()
        local ms = (math.floor(st.startuptime * 100 + 0.5) / 100)

        return knvim.startup.footer:isNullOrEmpty()
            and { "📦 Kin.nvim loaded " .. st.loaded .. "/" .. st.count .. " plugins in " .. ms .. "ms" }
          or { knvim.startup.footer }
      end,
    }

    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        once = true,
        pattern = tostring(vim.api.nvim_get_current_win()),
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return setup
  end,
  event = "VimEnter",
}
