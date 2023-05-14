-- Remaps!
--
-- The keymaps can be defines via vim.keymap.set and it takes 4
-- arguments: mode, key, command, options

local remap  = vim.keymap.set
local opts = { noremap = true, silent = true }

-- source/edit init.lua
remap('n', '<leader>ce', ':edit $MYVIMRC<cr>', opts)
remap('n', '<leader>cs', ':source $MYVIMRC<CR>', opts)

-- make navigating around splits easier
remap('n', '<C-j>', '<C-w>j', opts)
remap('n', '<C-k>', '<C-w>k', opts)
remap('n', '<C-h>', '<C-w>h', opts)
remap('n', '<C-l>', '<C-w>l', opts)

-- adjust split size easily
remap('n', '<C-Left>', ':vertical resize +3<CR>', opts)
remap('n', '<C-Right>', ':vertical resize -3<CR>', opts)
remap('n', '<C-Up>', ':resize +3<CR>', opts)
remap('n', '<C-Down>', ':resize -3<CR>', opts)

-- stop highlighting for the 'hlsearch'
remap('n', '<leader><esc>', ':nohlsearch<cr>', opts)

-- git
remap('n', '<leader>gb', ':Git blame<CR>', opts)
remap('n', '<leader>gs', ':vertical Git<CR>', opts)
remap('n', '<leader>gp', ':Git -c push.default=current push<CR>', opts)
remap('n', '<leader>gi', ':Git diff<CR>', opts)
remap('n', '<leader>gw', ':Gwrite<CR>', opts)
remap('n', '<leader>gl', ':GV<CR>', opts)

-- telescope
remap('n', '<C-p>', require('telescope.builtin').find_files, opts)
remap('n', '<C-f>', require('telescope.builtin').live_grep, opts)
remap('n', '<C-s>', require('telescope.builtin').grep_string, opts) -- need to install 'ripgrep'
remap('n', '<C-g>', require('telescope.builtin').lsp_references, opts)
remap('n', '<C-l>', require('telescope.builtin').treesitter, opts)
remap('n', '<C-l>', require('telescope.builtin').treesitter, opts)
remap('n', '<leader><space>', require('telescope.builtin').buffers, opts)
remap('n', '<leader>th', require('telescope.builtin').help_tags, opts)
remap('n', '<leader>gc', require('telescope.builtin').git_commits, opts)
remap('n', '<leader>tp', "<cmd>Telescope projects<cr>", opts)
remap('n', '<leader>ts', require('telescope.builtin').lsp_document_symbols, opts)

-- lsp
lsp_opts = { buffer = bufnr }
remap('n', '<leader>i', "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", lsp_opts)
remap('n', '<leader>h', vim.lsp.buf.hover, lsp_opts)
remap('n', '<leader>dd', vim.diagnostic.open_float, lsp_opts)
remap('n', 'gD', vim.lsp.buf.declaration, lsp_opts)
remap('n', 'gd', vim.lsp.buf.definition, lsp_opts)
remap('n', 'gi', vim.lsp.buf.implementation, lsp_opts)
remap('n', 'gr', vim.lsp.buf.references, lsp_opts)

-- trouble
remap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
remap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
remap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
remap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
remap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
remap("n", "<leader>rr", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- rename variable
remap('n', '<F2>', "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- neotest
remap('n', '<leader>tt', "<cmd>lua require('neotest').run.run(vim.fn.expand('%')) <cr>", opts)
