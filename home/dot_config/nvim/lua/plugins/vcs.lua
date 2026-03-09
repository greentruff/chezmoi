return {
  { "yannvanhalewyn/jujutsu.nvim", dependencies = { "clabby/difftastic.nvim" } },
  {
    "clabby/difftastic.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "folke/snacks.nvim",
    },
    opts = {
      download = true, -- prebuilt binary
      snacks_picker = {
        enabled = true,
      },
    },
  },
}
