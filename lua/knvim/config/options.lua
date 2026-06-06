local g = vim.g
local opt = vim.opt

--> Vim (g)
--> global variables
g.mapleader = " "

--> Vim (opt)
--> options variables
opt.mouse = "a"
opt.guifont = "monospace:h16"
opt.clipboard = "unnamedplus"
opt.fillchars = opt.fillchars + "eob: "
opt.splitkeep = "screen"
opt.background = "dark"
opt.inccommand = "split"
opt.signcolumn = "yes"
opt.completeopt = { "menuone", "noselect" }
opt.iskeyword:append("-")
opt.shortmess:append("c")
opt.whichwrap:append("<,>,[,],h,l")
opt.fillchars:append {
  stl = " ",
}

opt.tabstop = 2
opt.pumblend = 10
opt.cmdheight = 1
opt.pumheight = 10
opt.scrolloff = 10
opt.timeoutlen = 500
opt.updatetime = 200
opt.shiftwidth = 2
opt.numberwidth = 4
opt.showtabline = 2
opt.conceallevel = 0
opt.sidescrolloff = 8

opt.wrap = false
opt.title = false
opt.ruler = false
opt.backup = false
opt.number = true
opt.showcmd = false
opt.hlsearch = true
opt.undofile = true
opt.showmode = false
opt.swapfile = false
opt.expandtab = true
opt.incsearch = true
opt.smartcase = true
opt.cursorline = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.smartindent = true
opt.writebackup = false
opt.termguicolors = true
opt.relativenumber = false
