return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile      = { enabled = false },
    dashboard    = { enabled = false },
    explorer     = { enabled = false },
    indent       = { enabled = true },
    input        = { enabled = true },
    picker       = { enabled = true },
    notifier     = { enabled = true },
    quickfile    = { enabled = true },
    scope        = { enabled = true },
    scroll       = { enabled = false },
    statuscolumn = { enabled = true },
    words        = { enabled = true },
  },
  keys = {
    { "<leader>.", function() Snacks.scratch() end, desc = "Scratch buffer" },
  },
}
