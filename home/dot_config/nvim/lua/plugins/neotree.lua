return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({
          position = "float",
          toggle = true,
          reveal = true,
          dir = LazyVim.root(),
        })
      end,
      desc = "Explorer NeoTree (Root Dir)",
      remap = true,
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({
          position = "left",
          reveal = true,
          toggle = true,
          dir = vim.uv.cwd(),
        })
      end,
      desc = "Explorer NeoTree (cwd)",
      remap = true,
    },
  },
}
