-- nvim-treesitter `main` branch: parsers are installed imperatively via
-- `require('nvim-treesitter').install(...)` and highlighting is opted into
-- per filetype via `vim.treesitter.start()` on FileType.
local parsers = { "c", "lua", "rust", "python", "typescript" }

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
      pattern = parsers,
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
