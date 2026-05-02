return {
  "github/copilot.vim",
  event = "InsertEnter",
  init = function()
    vim.g.copilot_filetypes = {
      gitcommit = true,
      markdown  = true,
      yaml      = true,
    }
  end,
  config = function()
    vim.cmd("Copilot disable")
  end,
}
