return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  keys = { [[<C-\>]] },
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = "1",
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      group = vim.api.nvim_create_augroup("ToggleTermKeymaps", { clear = true }),
      callback = function()
        local map_opts = { buffer = 0, noremap = true }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], map_opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], map_opts)
        vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-W>h]], map_opts)
        vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-W>j]], map_opts)
        vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-W>k]], map_opts)
        vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-W>l]], map_opts)
      end,
    })
  end,
}
