return {
  {
    "eboody/maud-fmt.nvim",
    ft = "rust",
    opts = {
      indent_size = 2, -- 2-space indent inside html!{} (matches LazyVim shiftwidth)
      keymaps = {
        format = "<leader>mf", -- :MaudFormat manually if needed
      },
    },
    config = function(_, opts)
      require("maud-fmt").setup(opts)

      -- Auto-format Maud html!{} blocks on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rs",
        group = vim.api.nvim_create_augroup("maud_fmt", { clear = true }),
        callback = function()
          local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
          local has_maud = false
          for _, line in ipairs(lines) do
            if line:find("html!", 1, true) then
              has_maud = true
              break
            end
          end
          if has_maud and vim.g.autoformat ~= false then
            require("maud-fmt.formatter").format()
          end
        end,
      })
    end,
  },
}