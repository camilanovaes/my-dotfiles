return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    { "<F5>",      function() require("dap").continue() end,          desc = "DAP continue" },
    { "<F10>",     function() require("dap").step_into() end,         desc = "DAP step into" },
    { "<F11>",     function() require("dap").step_over() end,         desc = "DAP step over" },
    { "<F12>",     function() require("dap").step_out() end,          desc = "DAP step out" },
    { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "DAP toggle breakpoint" },
    {
      "<leader>B",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "DAP conditional breakpoint",
    },
    {
      "<leader>lp",
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end,
      desc = "DAP log point",
    },
    { "<leader>dr", function() require("dap").repl.open() end, desc = "DAP open REPL" },
    { "<F6>",       function() require("dapui").open() end,    desc = "DAP UI open" },
    { "<F7>",       function() require("dapui").close() end,   desc = "DAP UI close" },
  },
  config = function()
    require("nvim-dap-virtual-text").setup({})
    require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
    require("dapui").setup()
  end,
}
