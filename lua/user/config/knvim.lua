--> ©️ Knvim settings
_G.knvim = {}

--> 🎨 Themes
knvim.themes = {}
knvim.themes.knvim = "catppuccin-macchiato"
knvim.themes.lazy = { custom = knvim.themes.knvim, default = "habamax" }

--> ⚓ Dashboard
knvim.dashboard = {}
knvim.dashboard.header = nil

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