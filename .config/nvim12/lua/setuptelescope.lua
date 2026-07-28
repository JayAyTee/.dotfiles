require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "%.o",
      "node_modules/",
    }
  }
});
local builtin = require("telescope.builtin");
vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true});
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true});
vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true});
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true});
vim.keymap.set("n", "<leader>fm", builtin.man_pages , { noremap = true, silent = true});
