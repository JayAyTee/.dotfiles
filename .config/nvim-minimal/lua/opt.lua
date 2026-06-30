local o = vim.opt
local g = vim.g

o.number = true
o.relativenumber = true
o.termguicolors = true
o.ignorecase = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.swapfile = false
o.scrolloff = 8
o.wrap = false
o.termguicolors = true
o.signcolumn = "yes:1"
o.confirm = true
o.list = true
o.numberwidth = 2
o.cursorline = true
o.undodir = os.getenv('HOME') .. "/.vim/undodir"
o.undofile = true

g.netrw_banner = 0
