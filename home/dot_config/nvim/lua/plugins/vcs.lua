return {
  {
    "nicolasgb/jj.nvim",
    dependencies = { "folke/snacks.nvim", "esmuellert/codediff.nvim" },
    opts = {
      diff = {
        backend = "codediff",
      },
    },
    keys = {
      {
        "<leader>jl",
        function()
          require("jj.cmd").log()
        end,
        desc = "jj: Log",
      },
      {
        "<leader>js",
        function()
          require("jj.cmd").status()
        end,
        desc = "jj: Status",
      },
      {
        "<leader>jm",
        function()
          require("jj.cmd").describe()
        end,
        desc = "jj: Describe",
      },
      {
        "<leader>jd",
        function()
          require("jj.cmd").diff()
        end,
        desc = "jj: Diff",
      },
      {
        "<leader>jc",
        function()
          require("jj.cmd").commit()
        end,
        desc = "jj: Commit (checkpoint)",
      },
      {
        "<leader>jn",
        function()
          require("jj.cmd").new()
        end,
        desc = "jj: New change",
      },
      {
        "<leader>jp",
        function()
          require("jj.picker").status()
        end,
        desc = "jj: Pick status",
      },
    },
  },
}
