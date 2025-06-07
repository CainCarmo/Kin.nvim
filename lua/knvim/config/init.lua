require("knvim.helpers.folder").create(vim.fn.stdpath("config") .. "/lua/user/plugins")

require("knvim.helpers.file").write(
  vim.fn.stdpath("config") .. "/lua/user/knvim.lua",
  [[
local knvim = {}

-- Check a list of colorscheme available at `lua/knvim/plugins/colorschemes.lua`
knvim.colorscheme = "min-theme"

-- Customize the dashboard header and footer.
-- For more headers arts check: lua/knvim/layout/ascii.lua
knvim.dashboard = {
  header = Ascii.headers["knvim"],
  footer = "",
}

-- Configure your favorite languages and tools.
knvim.langs = {}

-- Check a list of all available packages, see https://mason-registry.dev/registry/list.
knvim.langs.lsp = {
  -- Only the names of the `LSPs` you want to install.
  names = {},
  -- Additional tools for `LSPs`, like `linters`, `formatters`, etc.
  tools = {},
}

-- Check a list of all available linters, see https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
-- Check a list of all available formatters, see https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
-- To configure both, use the schema { k = v[] }, where k represents the desired filetype (use `echo getcompletion('', 'filetype')` to view accepted filetypes), and v is the list of corresponding linters/formatters.
knvim.langs.linter = {}
knvim.langs.formatter = {}

-- Check a list of all available languages, see https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
knvim.langs.treesitter = {}

-- Check a list of all available adapters and configurations, see https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
knvim.langs.debugger = {
  adapters = {},
  configurations = {},
}

_G.Knvim = knvim

]]
)

require("knvim.autoload")
