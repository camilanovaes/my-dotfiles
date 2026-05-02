return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gwrite", "Gread", "Gdiff", "Gvdiffsplit", "Ghdiffsplit" },
    keys = {
      { "<leader>gb", ":Git blame<CR>",                        desc = "Git blame",  silent = true },
      { "<leader>gs", ":vertical Git<CR>",                     desc = "Git status", silent = true },
      { "<leader>gp", ":Git -c push.default=current push<CR>", desc = "Git push",   silent = true },
      { "<leader>gi", ":Git diff<CR>",                         desc = "Git diff",   silent = true },
      { "<leader>gw", ":Gwrite<CR>",                           desc = "Gwrite",     silent = true },
    },
  },
  {
    "junegunn/gv.vim",
    dependencies = { "tpope/vim-fugitive" },
    cmd = { "GV" },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
  },
  {
    "rbong/vim-flog",
    dependencies = { "tpope/vim-fugitive" },
    cmd = { "Flog", "Flogsplit", "Floggit" },
    keys = {
      { "<leader>gl", ":Flog<CR>", desc = "Flog", silent = true },
    },
  },
}
