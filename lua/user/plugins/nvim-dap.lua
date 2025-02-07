return {
  "rcarriga/nvim-dap-ui",
  keys = {
    {
      "<leader>dt",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle UI",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Launch",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step into function or line",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step over function or line",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_out()
      end,
      desc = "Step out of function",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.open()
      end,
      desc = "Open REPL",
    },
  },
  dependencies = {
    "folke/lazydev.nvim",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.adapters = table.merge(dap.adapters, knvim.langs.debugger.adapters)
    dap.configurations = table.merge(dap.configurations, knvim.langs.debugger.configurations)

    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end)
    vim.keymap.set("n", "<F9>", function()
      require("dap").toggle_breakpoint()
    end)
    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over()
    end)
    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end)
    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end)
  end,
}
