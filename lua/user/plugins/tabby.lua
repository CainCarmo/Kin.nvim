return {
  "nanozuki/tabby.nvim",
  keys = {
    { "<leader>[", "<cmd>$tabnew<CR>",  desc = "Create new tab" },
    { "<leader>]", "<cmd>tabclose<CR>", desc = "Close current tab" }
  },
  event = "VeryLazy",
  config = function()
    local theme = {
      win = "TabLine",
      tab = "TabLine",
      head = "TabLine",
      tail = "TabLine",
      fill = "TabLineFill",
      current_tab = { fg = "#F8FBF6", bg = "#896a98", style = "italic" },
    }

    require("tabby.tabline").set(function(line)
      return {
        {
          { "  ", hl = theme.head },
          line.sep("", theme.head, theme.fill),
        },
        line.tabs().foreach(
          function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep("", hl, theme.fill),
              tab.is_current() and "" or icons.ui.History:gsub(" ", ""),
              tab.number(),
              tab.name(),
              line.sep("", hl, theme.fill),
              hl = hl,
              margin = " "
            }
          end
        ),
        line.spacer(),
        {
          line.sep("", theme.tail, theme.fill),
          { "  ", hl = theme.tail }
        },
        hl = theme.fill
      }
    end)
  end
}