return {
  {
      'nvim-telescope/telescope.nvim',
      dependencies = {
          'nvim-lua/plenary.nvim',
          -- optional but recommended
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      },
      config = function()
        require("telescope").setup({
          defaults = {
            file_ignore_patterns = {
            }
          }
        });
        local builtin = require("telescope.builtin");
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true});
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true});
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true, silent = true});
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true});
      end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim"
  }
}
