return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<C-p>",           function() require("fzf-lua").files() end,      desc = "Find files", silent = true },
    { "<C-l>",           function() require("fzf-lua").live_grep() end,  desc = "Live grep",  silent = true },
    { "<C-t>",           function() require("fzf-lua").tags() end,       desc = "Tags",       silent = true },
    { "<C-s>",           function() require("fzf-lua").grep_cword() end, desc = "Grep cword", silent = true },
    { "<leader><space>", function() require("fzf-lua").buffers() end,    desc = "Buffers",    silent = true },
    {
      "<leader>ce",
      function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end,
      desc = "Edit nvim config",
      silent = true,
    },
  },
  opts = {
    keymap = {
      fzf = {
        ["ctrl-q"] = "select-all+accept",
      },
    },
  },
}
