vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local map = vim.keymap.set;

-- Saving and exploring
map("n","<leader>w", ":w<CR>");
map("n","<leader>q", ":q<CR>");
map("n","<leader>e", ":Ex<CR>");
-- Keeping things centered
map("n", "<C-d>", "<C-d>zz");
map("n", "<C-u>", "<C-u>zz");
-- Removing words with ctrl + backspace
map("i", "<C-BS>", "<Esc>ldbi");
-- Previous and next buffers
map("n", "<leader>bp", ":bprev<CR>")
map("n", "<leader>bn", ":bnext<CR>")
-- Turning off highlighting
map("n", "<leader>n", ":noh<CR>");
-- Moving lines
map("v", "J", ":m '>+1<CR>gv=gv");
map("v", "K", ":m '<-2<CR>gv=gv");
-- Folding line between
map("n", "J", "mzJ`z");
-- Pasting and deleting to void
map("x", "<leader><C-p>", [["_dP]]);
map({"n", "v"}, "<leader>d", [["_d]]);
-- Yanking and pasting from and to system clipboard
map({"n", "v"}, "<leader>y", [["+y]]);
map("n", "<leader>Y", [["+Y]]);
map({"n", "v"}, "<leader>p", [["+p]]);
-- Bash scripting
map("n", "<leader><C-b>", "mzgoO#!/bin/env bash<ESC>'z");
map("n", "<leader>x", "<cmd>!chmod +x %<CR>:filetype detect<CR>", {silent = true});
-- Windows
map("n", "<leader>v", "<C-w><C-v>");
map("n", "<leader>s", "<C-w><C-s>");
map("n", "<leader>l", "<C-w><C-l>");
map("n", "<leader>h", "<C-w><C-h>");
map("n", "<leader>j", "<C-w><C-j>");
map("n", "<leader>k", "<C-w><C-k>");
map("n", "<leader><Up>", "<C-w>+");
map("n", "<leader><Down>", "<C-w>-");
map("n", "<leader><Left>", "<C-w><");
map("n", "<leader><Right>", "<C-w>>");
-- Make
map("n", "<leader>m", "<cmd>!make<CR>");
-- Signature help
map({"i", "n"}, "<C-p>", vim.lsp.buf.signature_help);
-- Editing neovim config
map("n", "<leader><leader>env", ":edit " .. os.getenv("HOME") .. "/.config/nvim12/lua<CR>");
-- Escaping the terminal of doom!
map("t", "<Esc>", "<C-\\><C-n>");
-- Compiling
map("n", "<leader><leader>x", ":Compile<CR>");
