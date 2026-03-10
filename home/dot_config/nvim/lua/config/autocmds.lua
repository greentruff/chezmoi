if vim.fn.argc() == 0 then
  require("neo-tree.command").execute({
    position = "current",
    dir = vim.uv.cwd(),
  })
end
