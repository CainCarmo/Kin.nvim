local M = {
  "knvim.config.autocmds",
  "knvim.config.keymaps",
  "knvim.config.options",
}

for _, module in ipairs(M) do
  require(module)
end
