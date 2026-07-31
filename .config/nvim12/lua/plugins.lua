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
  "https://github.com/nvim-tree/nvim-web-devicons";
  "https://github.com/nvim-lualine/lualine.nvim",
});

require("nvim-autopairs").setup({});
require("setupharpoon");
require("setuptelescope");
require("setuplsp");
require("setupcomp");
require("setupdap");
require("lazydev").setup({
  ft = "lua", -- only load on lua files
  opts = {
    library = {
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
});
require("lualine").setup({
  options = {
    section_separators = { left = "", right = ""},
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
-- require('vim._core.ui2').enable({
--   enable = true, -- Whether to enable or disable the UI.
-- })
vim.api.nvim_create_augroup("jayaytee", { clear = true});
vim.api.nvim_create_autocmd("WinEnter", { command = "match BoldText /./", group = "jayaytee"});
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "jayaytee",
  pattern = "*",
  callback = function () vim.highlight.on_yank { timeout = 200 } end
});
require("lsp_signature").setup({});
require('nvim-highlight-colors').setup({})

vim.keymap.set("n", "<leader>cc", ":CompileCommand<CR>")
vim.keymap.set("n", "<leader>cr", ":Compile<CR>")
vim.keymap.set("n", "<leader>cv", ":CompileView<CR>")
vim.keymap.set("n", "<leader>cd", ":CompileClose<CR>")
