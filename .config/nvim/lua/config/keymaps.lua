vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local map = vim.keymap.set;

-- Saving and exploring
map("n","<leader>w", ":w<CR>");
map("n","<leader>q", ":q!<CR>");
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

-- C specific moving between header and code TODO: Make smarter to not only work with src and include dirs
local function goto_other_c()
  local bufname = vim.api.nvim_buf_get_name(0); -- Absolute path
  if string.sub(bufname, -2) == ".c" then -- Ends in .c
    local otherpath = string.sub(string.gsub(bufname, "src", "include"), 0, string.len(bufname)-3+7-2) .. ".h"; -- -3 (-src) +7 (+include) -2 (-.h)
    vim.cmd("edit " .. otherpath);
  end
  if string.sub(bufname, -2) == ".h" then -- Ends in .h
    local otherpath = string.sub(string.gsub(bufname, "include", "src"), 0, string.len(bufname)+3-7-2) .. ".c"; -- +3 (+src) -7 (-include) -2 (-.c)
    vim.cmd("edit " .. otherpath);
  end
end
map("n", "<leader><leader>o", goto_other_c);
