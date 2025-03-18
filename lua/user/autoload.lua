local M = {
  --> Load global variables
  "user.config.global",
  --> Load helpers functions
  "user.helpers.paths",
  "user.helpers.extensions.string",
  "user.helpers.extensions.table",
  --> Load layout variables
  "user.layout.ascii",
  "user.layout.icons",
  --> Load knvim
  "user.knvim",
  --> Load user configuration
  "user.config.autocmd",
  "user.config.keymap",
  "user.config.option",
}

for _, module in ipairs(M) do
  require(module)
end
