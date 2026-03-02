return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable({
      "lua_ls",
      "cssls",
      "css_variables",
      "eslint",
      "html",
      "ts_ls",
      "gdscript",
      "bashls",
      "rust_analyzer",
      "clangd",
      "glslls",
    });
    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format);
    vim.keymap.set("n", "K", vim.lsp.buf.hover);
    vim.keymap.set("n", "gd", vim.lsp.buf.definition);
    vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float);
    vim.diagnostic.enable = true;
    vim.diagnostic.config({
      virtual_text = true,
    });
  end
}
