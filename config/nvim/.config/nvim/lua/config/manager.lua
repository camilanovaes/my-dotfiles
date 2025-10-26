-- Manager the neovim plugins

-- Install lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Basics
  'tpope/vim-commentary',
  'tpope/vim-sleuth',
  'windwp/nvim-autopairs',

  -- Navegation
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
  },

  -- Git
  'tpope/vim-fugitive',
  'junegunn/gv.vim',
  'lewis6991/gitsigns.nvim',
  'sindrets/diffview.nvim',
  {
    'rbong/vim-flog',
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      'tpope/vim-fugitive',
    },
  },

  {
    -- LSP
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true, build = ":MasonUpdate" },
      'williamboman/mason-lspconfig.nvim',
      'saghen/blink.cmp',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        'j-hui/fidget.nvim',
        tag = "legacy", -- pin to legacy branch until rewritten is finished
        event = "LspAttach",
        opts = {}
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      {
        'folke/neodev.nvim',
        opts = {}
      },
    },
  },

  -- Inject additional stuff into LSP diagnostics/actions
  'nvimtools/none-ls.nvim',

  {
    -- Highlight, edit and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    -- Autocompletion
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = "*",
    opts = {
      keymap = {
        preset = 'default',
        ['<Enter>'] = { 'select_and_accept', 'fallback' }
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      signature = { enabled = true }
    }
  },
  {
    -- Finder
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-project.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    }
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {}
  },

  -- Visual
  { "catppuccin/nvim",                     name = "catppuccin" },
  'Mofiqul/dracula.nvim',
  { 'lukas-reineke/indent-blankline.nvim', main = "ibl",       opts = {} },
  'nvim-lualine/lualine.nvim',

  -- Tests
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python"
    }
  },
  {
    -- Debuging
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-telescope/telescope-dap.nvim',
    },
  },
  -- Copilot (testing)
  'github/copilot.vim',

  -- REPL
  {
    'jpalardy/vim-slime',
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_default_config = {
        socket_name = "default",
        target_pane = 2
      }
      vim.g.slime_dont_ask_default = 2
      vim.g.slime_python_ipython = 1
    end
  },

  -- Remote development
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",                     -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim",         -- For standard functions
      "MunifTanjim/nui.nvim",          -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    config = true,
  },
}, {})
