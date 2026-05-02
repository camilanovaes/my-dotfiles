-- Nvim Tree

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  init = function()
    -- Disable netrw so it doesn't race with nvim-tree on directory open.
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    { "<C-n>", ':NvimTreeToggle<CR>', desc = "Toggle NvimTree", silent = true },
  },
  opts = {
    view = {
      width = {
        min = 30,
        max = 50,     -- better to fit long names
      }
    }
  }
}
