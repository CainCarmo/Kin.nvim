--> 🌐 Globals
require "user.layout.ascii"
require "user.layout.icons"
require "user.helpers.paths"

--> 📦 Modules
require "user.helpers.extensions.string"
require "user.helpers.extensions.table"

--> ⚙️ Configs
require "user.config.autocmd"
require "user.config.keymap"
require "user.config.option"

--> ⚒ Validate knvim
local file = require "user.helpers.file"

file.write(
  paths.root .. "/lua/user/knvim.lua",
  [[
    ---@class Knvim
    _G.knvim = {}

    -- 📦 Explict knvim
    knvim.startup = {}
    knvim.theme = {}
    knvim.langs = {}
    knvim.langs.lsp = {}
    knvim.langs.treesitter = {}

    -- For more headers arts check: lua/user/layout/ascii.lua
    knvim.startup.header = ascii.headers.default
    knvim.startup.footer = ""

    knvim.theme.colorscheme = "gruvbox"

    -- Check a list of all available packages, see https://mason-registry.dev/registry/list.
    knvim.langs.lsp.names = {}
    knvim.langs.lsp.tools = {}


    -- Check a list of all available languages, see https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    knvim.langs.treesitter.names = {}
  ]]
)

--> 📦 Inicializate Knvim
require "user.knvim"
