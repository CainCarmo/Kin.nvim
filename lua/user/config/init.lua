--> ⚒ Generate knvim
require("user.helpers.file").write(
  vim.fn.stdpath("config") .. "/lua/user/knvim.lua",
  [[
-- 📦 Explict knvim
knvim.startup = {}
knvim.theme = {}
knvim.langs = {}
knvim.langs.lsp = {}
knvim.langs.linter = {}
knvim.langs.formatter = {}
knvim.langs.treesitter = {}
knvim.langs.debugger = {}

-- For more headers arts check: lua/user/layout/ascii.lua
knvim.startup.header = ascii.headers.default
knvim.startup.footer = ""

knvim.theme.colorscheme = "min-theme"

-- Check a list of all available packages, see https://mason-registry.dev/registry/list.
knvim.langs.lsp.names = {}
knvim.langs.lsp.tools = {}

-- Check a list of all available linters, see https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters
-- Check a list of all available formatters, see https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
-- To configure both, use the schema { k = v[] }, where k represents the desired filetype (use `echo getcompletion('', 'filetype')` to view accepted filetypes), and v is the list of corresponding linters/formatters.
knvim.langs.linter.names = {}
knvim.langs.formatter.names = {}

-- Check a list of all available adapters and configurations, see https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
knvim.langs.debugger.adapters = {}
knvim.langs.debugger.configurations = {}

-- Check a list of all available languages, see https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
knvim.langs.treesitter.names = {}
]]
)

--> ⚙️ Load user configuration
require("user.autoload")
