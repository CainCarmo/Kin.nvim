local opts = { silent = true }
local keymap = vim.keymap.set

--> Built-in keymaps
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "<ESC>", "<cmd>noh<CR>", opts)

keymap({ "n", "v" }, ";", ":", opts)
keymap({ "n", "v" }, "<C-z>", "u", opts)
keymap({ "n", "v" }, "<C-s>", "<cmd>w<CR>", opts)
keymap({ "n", "v" }, "<A-Up>", "<Esc>:m .-2<CR>", opts)
keymap({ "n", "v" }, "<A-Down>", "<Esc>:m .+1<CR>", opts)
