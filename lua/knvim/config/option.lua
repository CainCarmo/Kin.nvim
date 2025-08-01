--> Vim (g)
vim.g.mapleader = " "
vim.g.copilot_lsp_settings = {
  telemetry = {
    telemetryLevel = "off",
  },
}

--> Vim (o)
vim.o.background = "dark"

--> Vim (opt)
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.fileencoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.guifont = "monospace:h16"
vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.cmdheight = 1
vim.opt.conceallevel = 0
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.timeoutlen = 1000
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 8
vim.opt.updatetime = 200
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.numberwidth = 4
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.backup = false
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.title = false

vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append {
  stl = " ",
}

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
