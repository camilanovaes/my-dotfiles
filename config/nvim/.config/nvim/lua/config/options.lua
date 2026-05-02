-- editor options

-- global options
vim.o.mouse            = "a"
vim.opt.inccommand     = "nosplit"
vim.opt.background     = "dark"
vim.opt.completeopt    = "menuone,noselect"
vim.opt.swapfile       = false
vim.opt.smartcase      = true
vim.opt.laststatus     = 2
vim.opt.incsearch      = true
vim.opt.hlsearch       = false
vim.opt.ignorecase     = true
vim.opt.errorbells     = false
vim.opt.scrolloff      = 8
vim.opt.smarttab       = true
vim.opt.backup         = false
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.showmode       = false
vim.opt.termguicolors  = true
vim.opt.tabstop        = 2
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true
vim.opt.smartindent    = false
vim.o.undofile         = true
vim.o.updatetime       = 250
vim.o.timeout          = true
vim.o.timeoutlen       = 300

-- window-local options
vim.wo.number          = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.colorcolumn    = { "80", "120" }
vim.opt.conceallevel   = 0

-- buffer-local options
vim.opt.textwidth      = 79

-- spell checking (enabled per-filetype via autocmd below)
vim.opt.spelllang      = "en_us"

-- indent-blankline expects list mode and an end-of-line listchar
vim.opt.list           = true
vim.opt.listchars:append("eol:↴")

-- diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- autocmds
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Remove trailing whitespace on save",
  group = vim.api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true }),
  command = [[:%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("HighlightYankGrp", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Enable spell-check for prose filetypes",
  group = vim.api.nvim_create_augroup("SpellProse", { clear = true }),
  pattern = { "gitcommit", "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})
