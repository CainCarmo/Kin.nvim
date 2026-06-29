local M = {
  "knvim.assets.ascii",
  "knvim.assets.icons",
}

for _, module in ipairs(M) do
  require(module)
end
