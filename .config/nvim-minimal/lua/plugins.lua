vim.pack.add({
  "https://github.com/sainnhe/edge",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  -- "https://github.com/vieitesss/miniharp.nvim",
  "https://github.com/JayAyTee/miniharp.nvim",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1"
  },
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",
})

vim.cmd.colorscheme("edge");
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start);
  end,
});
require("nvim-autopairs").setup({})
require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node%_modules/.*" }
  }
});
local builtin = require("telescope.builtin");
local map = vim.keymap.set;
map("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true});
map("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true});
map("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true});
map("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true});

local miniharp = require("miniharp");
miniharp.setup({
  autoload = true,
  autosave = true,
  show_on_autoload = false
})
map("n", "<leader>a", miniharp.toggle_file);
map("n", "<leader>d", miniharp.show_list);
map("n", "<leader><leader>j", miniharp.next);
map("n", "<leader><leader>f", miniharp.prev);
map("n", "<leader>1", function() miniharp.go_to(1) end);
for i = 1, 9 do
  map("n", "<leader>" .. i, function() miniharp.go_to(i) end);
  map({ "n", "i" }, "<C-" .. i .. ">", function() miniharp.go_to(i) end);
end
vim.filetype.add({
  extension = {
    ejs = "html",
  }
});
vim.lsp.enable({
  "lua_ls",
  "cssls",
  "css_variables",
  "eslint",
  "html-lsp",
  "ts_ls",
  "gdscript",
  "bashls",
  "rust_analyzer",
  "clangd",
  "glslls",
  "emmet-ls",
  "emmet-language-server"
});
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format);
vim.keymap.set("n", "K", vim.lsp.buf.hover);
vim.keymap.set("n", "gd", vim.lsp.buf.definition);
vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float);
vim.diagnostic.enable = true;
vim.diagnostic.config({
  virtual_text = true,
});
vim.lsp.config("ts_ls", {
  filetypes = {
    "javascript",
    "html",
    "ejs"
  }
});
require("mason").setup({});
require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' }
  },
  signature = {
    enabled = true,
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
});
require("luasnip.loaders.from_vscode").lazy_load()
