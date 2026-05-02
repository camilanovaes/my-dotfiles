-- editor keymaps, plugin keymaps should go to the plugin file

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- source init.lua
map("n", "<leader>cs", ":source $MYVIMRC<CR>", opts)

-- split navigation
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- resize splits
map("n", "<C-Left>", ":vertical resize +3<CR>", opts)
map("n", "<C-Right>", ":vertical resize -3<CR>", opts)
map("n", "<C-Up>", ":resize +3<CR>", opts)
map("n", "<C-Down>", ":resize -3<CR>", opts)

-- clear hlsearch
map("n", "<leader><esc>", ":nohlsearch<CR>", opts)

-- system clipboard
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)
map("v", "<leader>p", '"_dP', opts)

-- move highlighted text
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- diagnostics
map("n", "<leader>dd", vim.diagnostic.open_float, opts)
map("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- tmux helpers
map("n", "<C-f>", ":!tmux neww tmux-session<CR>", opts)
map("n", "<C-g>", ":!tmux neww tmux-switcher<CR>", opts)
