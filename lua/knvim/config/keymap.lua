local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

--> Built-in
keymap("n", "<ESC>", "<cmd>noh<CR>", opts) -- #: Clear search highlights

keymap("v", "<", "<gv", opts) -- #: Indent left
keymap("v", ">", ">gv", opts) -- #: Indent right

keymap({ "n", "v" }, ";", ":", opts) -- #: Command mode
keymap({ "n", "v" }, "<C-z>", "u", opts) -- #: Undo
keymap({ "n", "v" }, "<C-s>", "<cmd>w<CR>", opts) -- #: Save
keymap({ "n", "v" }, "<A-Up>", "<Esc>:m .-2<CR>", opts) -- #: Move line up
keymap({ "n", "v" }, "<A-Down>", "<Esc>:m .+1<CR>", opts) -- #: Move line down

--> Plugins
keymap({ "n", "v" }, "<S-o>", function()
  vim.cmd [[ AerialToggle! ]]
end, opts) -- #: Aerial (Toggle)

keymap({ "n", "v" }, "<TAB>", "<cmd>bnext<CR>", opts) -- #: Tabline (Next buffer)
keymap({ "n", "v" }, "<S-TAB>", "<cmd>bprevious<CR>", opts) -- #: Tabline (Previous buffer)
keymap({ "n", "v" }, "<S-w>", "<cmd>bdelete<CR>", opts) -- #: Tabline (Delete buffer)

keymap("t", "<ESC>", "<C-\\><C-n>", opts) -- #: ToggleTerm (Exit terminal mode)
keymap({ "n", "v", "t" }, "<C-ESC>", "<cmd>ToggleTerm<CR>", opts) -- #: ToggleTerm (Open Terminal)
