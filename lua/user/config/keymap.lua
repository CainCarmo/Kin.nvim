local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)

keymap("n", "<ESC>", "<cmd>noh<CR>", opts)

keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)
keymap({ "n", "v" }, ";", ":", opts)
keymap({ "n", "v" }, "<C-s>", "<cmd>w<CR>", opts)
keymap({ "n", "v" }, "<C-y>", "<C-r>", opts)
keymap({ "n", "v" }, "<C-z>", "u", opts)
keymap({ "n", "v" }, "<A-Up>", "<Esc>:m .-2<CR>", opts)
keymap({ "n", "v" }, "<A-Down>", "<Esc>:m .+1<CR>", opts)
keymap({ "n", "v" }, "<TAB>", "<cmd>tabn<CR>", opts)
