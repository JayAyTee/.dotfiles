vim.pack.add({
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/ThePrimeagen/harpoon",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/Saghen/blink.lib",
	"https://github.com/Saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/sainnhe/gruvbox-material",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/sainnhe/edge",
	"https://github.com/sainnhe/everforest",
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/ray-x/lsp_signature.nvim",
	"https://github.com/brenoprata10/nvim-highlight-colors",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/christoomey/vim-tmux-navigator",
});

require("nvim-autopairs").setup({});
require("setupharpoon");
require("setuptelescope");
require("setuplsp");
require("setupcomp");
require("setupdap");
require("setupmisc");
require("setuplooks");
require("lsp_signature").setup({});
require('nvim-highlight-colors').setup({})
require("nvim-treesitter").setup({})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "java" },
	callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = "jayaytee",
	pattern = "*",
	callback = function() vim.highlight.on_yank { timeout = 200 } end
});

vim.keymap.set("n", "<leader>cc", ":CompileCommand<CR>")
vim.keymap.set("n", "<leader>cr", ":Compile<CR>")
vim.keymap.set("n", "<leader>cv", ":CompileView<CR>")
vim.keymap.set("n", "<leader>cd", ":CompileClose<CR>")

require('vim._core.ui2').enable({
	enable = true, -- Whether to enable or disable the UI.
})

vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
