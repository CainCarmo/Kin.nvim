return {
  "mg979/vim-visual-multi",
  lazy = true,
  keys = {
    { "<leader>ma", "<Plug>(VM-Select-All)<Tab>",    desc = "Select All",         mode = "n" },
    { "<leader>mo", "<Plug>(VM-Toggle-Mappings)",    desc = "Toggle Mapping",     mode = "n" },
    { "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)",  desc = "Add Cursor At Pos",  mode = "n" },
    { "<leader>mr", "<Plug>(VM-Start-Regex-Search)", desc = "Start Regex Search", mode = "n" },
    {
      "<leader>mm",
      function()
        vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
        vim.cmd('sleep 200m')
        vim.cmd('silent! execute "normal! A"')
      end,
      desc = "Visual Cursors",
      mode = "v"
    }
  },
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = ""
    }
    vim.g.VM_default_mappings = 0
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end
}