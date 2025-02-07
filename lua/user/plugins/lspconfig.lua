return {
  "neovim/nvim-lspconfig",
  keys = {
    { "<leader>li", "<cmd>LspInfo<CR>", desc = "Info" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Quickfix" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", desc = "CodeLens Action" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev Diagnostic" },
  },
  opts = {
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/inlayHint" then vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end
    end,
    common_capabilities = function()
      local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      if status then capabilities = cmp_nvim_lsp.default_capabilities() end

      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = { "documentation", "detail", "additionalTextEdits" },
      }

      return capabilities
    end,
  },
  event = "BufReadPre",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
  },
  config = function(_, opts)
    local lspconfig = require "lspconfig"
    local servers = require("mason-lspconfig").get_installed_servers()

    vim.diagnostic.config {
      signs = {
        active = true,
        values = {
          { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
          { name = "DiagnosticSignError", text = icons.diagnostics.Error },
          { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
          { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
        },
      },
      underline = true,
      virtual_text = false,
      severity_sort = true,
      update_in_insert = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
      vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, numhl = sign.name })
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    require("lspconfig.ui.windows").default_options.border = "rounded"

    for _, server in pairs(servers) do
      local config = {
        on_attach = opts.on_attach,
        capabilities = opts.common_capabilities(),
      }

      local status, lspsettings = pcall(require, "user.utils.lsp." .. server)
      if status then config = vim.tbl_deep_extend("force", lspsettings, config) end

      lspconfig[server].setup(config)
    end
  end,
}
