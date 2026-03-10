return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
  },
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
