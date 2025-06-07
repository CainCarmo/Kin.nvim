local M = {
  --> Load global modules
  "knvim.config.global",

  --> Load helper modules
  "knvim.helpers.extensions.string",
  "knvim.helpers.extensions.table",

  --> Load layout modules
  "knvim.layout.ascii",
  "knvim.layout.colors",
  "knvim.layout.icons",

  --> Load knvim module
  "user.knvim",

  --> Load core configuration
  "knvim.config.autocmd",
  "knvim.config.keymap",
  "knvim.config.option",
}

for _, module in ipairs(M) do
  require(module)
end
