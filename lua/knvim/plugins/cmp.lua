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
      { name = "cmdline" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = string.format("%s %s", (" " .. Icons.kind[vim_item.kind] .. " ") or "", vim_item.kind)
        vim_item.dup = ({
          path = 0,
          buffer = 0,
          cmdline = 0,
          luasnip = 0,
          nvim_lsp = 0,
        })[entry.source.name] or 0

        return vim_item
      end,
      fields = { "abbr", "kind", "menu" },
    },
    confirm_opts = {
      select = false,
    },
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
  },
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp" },
    {
      "hrsh7th/cmp-nvim-lua",
      ft = "lua",
    },
    { "github/copilot.vim" },
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
    },
  },
  config = function(_, opts)
    local cmp, luasnip = require "cmp", require "luasnip"

    local function check_backspace()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    opts.snippet = {
      expand = function(args)
        require("luasnip/loaders/from_vscode").lazy_load()
        luasnip.lsp_expand(args.body)
      end,
    }
    opts.mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm { select = true },
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

    opts.confirm_opts.behavior = cmp.ConfirmBehavior.Replace
    cmp.setup(opts)
  end,
}
