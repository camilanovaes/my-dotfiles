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
    { "<leader>.",       function() Snacks.scratch() end,                                        desc = "Scratch buffer" },
    { "<C-p>",           function() Snacks.picker.smart() end,                                   desc = "Smart find files" },
    { "<C-l>",           function() Snacks.picker.grep() end,                                    desc = "Live grep" },
    { "<C-s>",           function() Snacks.picker.grep_word() end,                               desc = "Grep word",        mode = { "n", "x" } },
    { "<leader><space>", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<C-t>",           function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "Workspace symbols" },
    { "<leader>ce",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Edit nvim config" },
  },
}
