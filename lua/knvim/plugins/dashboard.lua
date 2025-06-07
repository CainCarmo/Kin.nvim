return {
  "nvimdev/dashboard-nvim",
  keys = {
    { "<leader>;", "<cmd>Dashboard<CR>", desc = "Dashboard", mode = { "n", "v" } },
  },
  lazy = false,
  event = "VimEnter",
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
      header = vim.split(
        string.rep("\n", 3) .. table.concat(Knvim.dashboard.header, "\n") .. string.rep("\n", 2),
        "\n"
      ),
      center = {
        button("New File", "ene | startinsert", Icons.ui.NewFile, "n"),
        button("Find File", "<cmd>Telescope find_files<CR>", Icons.ui.FindFile, "f"),
        button("Find Word", "<cmd>Telescope live_grep<CR>", Icons.ui.FindText, "w"),
        button("Recent Files", "<cmd>Telescope oldfiles<CR>", Icons.ui.History, "r"),
        button("Recent Sessions", "lua require('persistence').select()", Icons.ui.Scopes, "s"),
        button("Restore Sessions", "lua require('persistence').load()", Icons.ui.Forward, "S"),
        button("Configuration", "e " .. vim.fn.stdpath("config") .. "/init.lua", Icons.ui.Gear, "c"),
        button("Quit", function()
          require("persistence").stop()
          vim.cmd [[ qa ]]
        end, Icons.ui.SignOut, "q"),
      },
      footer = function()
        local st = require("lazy").stats()
        local ms = (math.floor(st.startuptime * 100 + 0.5) / 100)

        return Knvim.dashboard.footer:isNullOrEmpty()
            and { "📦 Kin.nvim loaded " .. st.loaded .. "/" .. st.count .. " plugins in " .. ms .. "ms" }
          or { Knvim.dashboard.footer }
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
}
