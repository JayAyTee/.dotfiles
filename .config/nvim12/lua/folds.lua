-- vim.opt.viewoptions = { "folds", "cursor", "curdir" }
-- vim.opt.viewdir = vim.fn.stdpath("data") .. "/view"
-- vim.opt.viewoptions:append("slash")
-- vim.opt.viewoptions:append("unix")
-- vim.api.nvim_create_autocmd("BufWinLeave", {
--   pattern = "*",
--   callback = function()
--     if vim.bo.buftype == "" then
--       vim.cmd("mkview")
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   pattern = "*",
--   callback = function()
--     if vim.bo.buftype == "" then
--       vim.cmd("silent! loadview")
--     end
--   end,
-- })
local view_group = vim.api.nvim_create_augroup("auto_view", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
	desc = "Save view with mkview for real files",
	group = view_group,
	callback = function(args)
		if vim.b[args.buf].view_activated then vim.cmd.mkview { mods = { emsg_silent = true } } end
	end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Try to load file view if available and enable view saving for real files",
	group = view_group,
	callback = function(args)
		if not vim.b[args.buf].view_activated then
			local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
			local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
			local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
			if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
				vim.b[args.buf].view_activated = true
				vim.cmd.loadview { mods = { emsg_silent = true } }
			end
		end
	end,
})
-- local ns = vim.api.nvim_create_namespace("fold_count")
-- local function update_fold_virtual_text(buf)
-- 	vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
-- 	local line_count = vim.api.nvim_buf_line_count(buf)
-- 	local lnum = 1
-- 	while lnum <= line_count do
-- 		local fold_start = vim.fn.foldclosed(lnum)
-- 		if fold_start == lnum then
-- 			local fold_end = vim.fn.foldclosedend(lnum)
-- 			local folded_lines = fold_end - fold_start
-- 			vim.api.nvim_buf_set_extmark(buf, ns, lnum - 1, 0, {
-- 				virt_text = {
-- 					{ folded_lines .. " lines", "Comment" }
-- 				},
-- 				virt_text_pos = "eol",
-- 			})
-- 			lnum = fold_end + 1
-- 		else
-- 			lnum = lnum + 1
-- 		end
-- 	end
-- end
-- vim.api.nvim_create_autocmd({
-- 	"BufWinEnter",
-- 	"TextChanged",
-- 	"TextChangedI",
-- }, {
-- 	callback = function(args)
-- 		update_fold_virtual_text(args.buf)
-- 	end,
-- })
-- vim.opt.foldtext = ""
