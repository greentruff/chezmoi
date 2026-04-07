return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_c = {
          LazyVim.lualine.pretty_path({ length = 0 }),
        },
      },
    },
  },
}
