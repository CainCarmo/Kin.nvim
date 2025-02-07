return {
  "echasnovski/mini.hipatterns",
  opts = {
    highlighters = {
      fix = { pattern = "%f[%w]()FIX()%f[%W]", group = "MiniHipatternsFix" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    },
  },
  version = false,
  config = function(_, opts)
    local hipatterns = require "mini.hipatterns"

    opts.hex_color = hipatterns.gen_highlighter.hex_color()
    hipatterns.setup(opts)
  end,
}
