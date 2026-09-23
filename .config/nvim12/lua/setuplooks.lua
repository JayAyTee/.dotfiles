require("lualine").setup({
	options = {
		section_separators = { left = "", right = "" },
		theme = "onedark", -- edge colorscheme
		-- theme = "everforest",
	}
});

-- vim.cmd.colorscheme "gruvbox-material"
vim.cmd.colorscheme "edge"
-- vim.g.everforest_background = "soft"
-- vim.cmd.colorscheme "everforest"
vim.cmd.highlight "BoldText gui=bold"
vim.cmd.match "BoldText /./"
vim.api.nvim_create_augroup("jayaytee", { clear = true });
vim.api.nvim_create_autocmd("WinEnter", { command = "match BoldText /./", group = "jayaytee" });
