return {
  "hrsh7th/nvim-cmp",
  opts = {
    window = {
      completion = {
        border = "rounded",
        scrollbar = false,
        winhighlight = "Normal:CmpPmenu",
      },
      documentation = { border = "rounded" },
    },
    sources = {
      { name = "path" },
      { name = "buffer" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
    },
    formatting = {
      format = function(_, vim_item)
        vim_item.kind = string.format("%s %s", (" " .. Icons.kind[vim_item.kind] .. " ") or "", vim_item.kind)
        return vim_item
      end,
      fields = { "abbr", "kind", "menu" },
    },
    confirm_opts = {
      select = false,
    },
    experimental = {
      ghost_text = false,
      native_menu = false,
    },
  },
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    {
      "hrsh7th/cmp-nvim-lua",
      ft = "lua",
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
    },
    { "github/copilot.vim" },
  },
  config = function(_, opts)
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    local function check_backspace()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    opts.confirm_opts.behavior = cmp.ConfirmBehavior.Replace
    opts.snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    }
    opts.mapping = cmp.mapping.preset.insert({
      ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })

    require("luasnip/loaders/from_vscode").lazy_load()
    cmp.setup(opts)
  end,
}
