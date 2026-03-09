return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "cd", vim.lsp.buf.rename, desc = "Rename symbol" },
          { "<C-CR>", vim.lsp.buf.code_action, desc = "Code actions" },
          { "<C-;>", function() Snacks.picker.lsp_workspace_symbols({ filter = LazyVim.config.kind_filter }) end, desc = "Workspace symbol search" },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              library = { vim.env.VIMRUNTIME },
            },
          },
        },
      },
    },
  },
}
