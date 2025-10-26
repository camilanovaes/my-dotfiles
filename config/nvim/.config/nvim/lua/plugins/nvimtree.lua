-- nvim-tree
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Use ":vertical resize N" to set a specific size
require("nvim-tree").setup({
    view = {
        width = {
            min = 30,
            max = 50, -- better to fit long names
        }
    }
})
