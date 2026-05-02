return {
  "jpalardy/vim-slime",
  event = "VeryLazy",
  init = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = {
      socket_name = "default",
      target_pane = 2,
    }
    vim.g.slime_dont_ask_default = 2
    vim.g.slime_python_ipython = 1
  end,
}
