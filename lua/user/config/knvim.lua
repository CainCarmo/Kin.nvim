--> ©️ Knvim settings
_G.knvim = {}

--> 🎨 Themes
knvim.themes = {}
knvim.themes.knvim = "catppuccin"
knvim.themes.lazy = { custom = knvim.themes.knvim, default = "habamax" }

--> ⚠️ Protocls
knvim.protocols = {}
knvim.protocols.lsps = {}

knvim.protocols.lsps.names = {
  --> Example
  --> TS
  -- ts_ls
  -- ...
}
knvim.protocols.lsps.tools = {
  --> Example
  --> JS
  -- "biome",
  -- "prettier"
  -- ...
}