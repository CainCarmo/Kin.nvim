return {
  "neovim/nvim-lspconfig",
  keys = {
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",   desc = "Code Action" },
    {
      "<leader>lf",
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      desc = "Format",
    },
    { "<leader>li", "<cmd>LspInfo<cr>",                         desc = "Info" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>",  desc = "Next Diagnostic" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",  desc = "Prev Diagnostic" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",      desc = "CodeLens Action" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",        desc = "Rename" },
  },
  event = "BufReadPost",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim"
  },
  opts = {
    on_attach = function(client, bufnr)
      if client.supports_method "textDocument/inlayHint" then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end,
    common_capabilities = function()
      local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      if status then capabilities = cmp_nvim_lsp.default_capabilities() end

      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        }
      }

      return capabilities
    end
  },
  config = function(_, opts)
    local lspconfig = require "lspconfig"
    local servers = require("mason-lspconfig").get_installed_servers()

    local diagnostics_setttings = {
      signs = {
        active = true,
        values = {
          { name = "DiagnosticSignError", text = icons.diagnostics.Error },
          { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
          { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
          { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
        }
      },
      virtual_text = false,
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = ""
      },
    }

    vim.diagnostic.config(diagnostics_setttings)

    for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

    require("lspconfig.ui.windows").default_options.border = "rounded"

    for _, server in pairs(servers) do
      local config = {
        on_attach = opts.on_attach,
        capabilities = opts.common_capabilities()
      }

      -- TODO: change path
      local status, settings = pcall(require, "user.resources.lspconfig." .. server)

      if status then
        config = vim.tbl_deep_extend("force", settings, config)
      end

      lspconfig[server].setup(config)
    end
  end
}