vim.opt.viewoptions = { "folds", "cursor", "curdir" }
vim.opt.viewdir = vim.fn.stdpath("data") .. "/view"
vim.opt.viewoptions:append("slash")
vim.opt.viewoptions:append("unix")
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
