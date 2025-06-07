local colors = {}

colors["min-theme"] = {
  dark = {
    -- #: Backgrounds
    bg0 = "#1A1A1A",
    bg1 = "#292929",
    bg2 = "#383838",
    bg3 = "#282828",

    -- #: Foregrounds
    fg0 = "#c1c1c1",
    fg1 = "#FAFAFA",
    fg2 = "#E0E0E0",
    fg3 = "#484848",

    -- #: Colors
    red = "#cd3131",
    blue = "#79b8ff",
    green = "#22863a",
    orange = "#FF9800",
    purple = "#9966cc",
  },
  light = {
    -- #: Backgrounds
    bg0 = "#dddddd",
    bg1 = "#f6f6f6",
    bg2 = "#e0e0e0",
    bg3 = "#f0f0f0",

    -- #: Foregrounds
    fg0 = "#616161",
    fg1 = "#212121",
    fg2 = "#424242",
    fg3 = "#9E9E9E",

    -- #: Colors
    red = "#D32F2F",
    blue = "#6871ff",
    green = "#22863a",
    orange = "#f29718",
    purple = "#9966cc",
  },
}

colors["gruvbox"] = {
  dark = {
    -- #: Backgrounds
    bg0_h = "#1d2021",
    bg0_s = "#32302f",
    bg0 = "#282828",
    bg1 = "#3c3836",
    bg2 = "#504945",
    bg3 = "#665c54",
    bg4 = "#7c6f64",
    bg5 = "#928374",

    -- #: Foregrounds
    fg0 = "#fbf1c7",
    fg1 = "#ebdbb2",
    fg2 = "#d5c4a1",
    fg3 = "#bdae93",
    fg4 = "#a89984",

    -- #: Colors
    red = "#fb4934",
    red_dark = "#cc241d",
    green = "#b8bb26",
    green_dark = "#98971a",
    yellow = "#fabd2f",
    yellow_dark = "#d79921",
    blue = "#83a598",
    blue_dark = "#458588",
    purple = "#d3869b",
    purple_dark = "#b16286",
    aqua = "#8ec07c",
    aqua_dark = "#689d6a",
    orange = "#fe8019",
    orange_dark = "#d65d0e",
    gray = "#a89984",
    gray_dark = "#928374",
  },
  light = {
    -- #: Backgrounds
    bg0_h = "#f9f5d7",
    bg0_s = "#f2e5bc",
    bg0 = "#fbf1c7",
    bg1 = "#ebdbb2",
    bg2 = "#d5c4a1",
    bg3 = "#bdae93",
    bg4 = "#a89984",
    bg5 = "#928374",

    -- #: Foregrounds
    fg0 = "#282828",
    fg1 = "#3c3836",
    fg2 = "#504945",
    fg3 = "#665c54",
    fg4 = "#7c6f64",

    -- #: Colors
    red = "#cc241d",
    red_ark = "#9d0006",
    green = "#98971a",
    green_ark = "#79740e",
    yellow = "#d79921",
    yellow_ark = "#b57614",
    blue = "#458588",
    blue_ark = "#076678",
    purple = "#b16286",
    purple_ark = "#8f3f71",
    aqua = "#689d6a",
    aqua_ark = "#427b58",
    orange = "#d65d0e",
    orange_ark = "#af3a03",
    gray = "#928374",
    gray_ark = "#7c6f64",
  },
}

_G.Colors = colors
