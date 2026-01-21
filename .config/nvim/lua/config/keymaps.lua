vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.api.nvim_set_keymap("n","<leader>w", ":w<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap("n","<leader>q", ":q!<CR>", { noremap = true, silent = true });
vim.api.nvim_set_keymap("n","<leader>e", ":Ex<CR>", { noremap = true, silent = true });
vim.keymap.set("n", "<C-d>", "<C-d>zz");
vim.keymap.set("n", "<C-u>", "<C-u>zz");
vim.keymap.set("i", "<C-BS>", "<Esc>ldbi", { noremap = true, silent = true });
vim.keymap.set("n", "<leader>bp", ":bprev<CR>")
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
