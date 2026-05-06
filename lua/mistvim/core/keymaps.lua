-------------------------------------------------
-- Keymaps
-------------------------------------------------
local keymap = vim.keymap

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
