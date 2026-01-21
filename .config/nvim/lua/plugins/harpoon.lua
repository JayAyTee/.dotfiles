return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local mark = require("harpoon.mark");
    local ui = require("harpoon.ui");

    vim.keymap.set("n", "<leader>a", mark.add_file);
    vim.keymap.set("n", "<leader>d", ui.toggle_quick_menu);

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>" .. i, function() ui.nav_file(i) end);
      vim.keymap.set({ "n", "i" }, "<C-" .. i .. ">", function() ui.nav_file(i) end);
    end
  end
}
