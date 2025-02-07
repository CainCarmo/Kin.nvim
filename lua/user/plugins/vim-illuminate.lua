return {
  "RRethy/vim-illuminate",
  event = "BufReadPost",
  config = function()
    require("illuminate").configure {
      filetypes_denylist = {
        "qf",
        "lir",
        "Jaq",
        "lazy",
        "mason",
        "netrw",
        "trouble",
        "Outline",
        "dirvish",
        "triptych",
        "dashboard",
        "minifiles",
        "DiffviewFiles",
        "spectre_panel",
        "TelescopePrompt",
      },
    }
  end,
}
