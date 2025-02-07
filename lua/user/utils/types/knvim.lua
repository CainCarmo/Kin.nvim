---@meta

---@class KnvimTheme
---@field colorscheme string

---@class KnvimStarup
---@field header table<string>
---@field footer string | nil

---@class KnvimLangs
---@field lsp { names: string[], tools: string[] }
---@field linter { names: string[] }
---@field formatter { names: table<string, string[]> }
---@field treesitter { names: table<string, string[]> }

---@class Knvim
---@field theme KnvimTheme
---@field langs KnvimLangs
---@field startup KnvimStarup
