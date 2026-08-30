return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "caddy" },
    },
    init = function()
      vim.filetype.add({
        filename = {
          Caddyfile = "caddy",
        },
      })
    end,
  },
}
