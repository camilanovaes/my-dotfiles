return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "lua_ls",
          "pyright",
          "clangd",
          "ts_ls",
          "cssls",
          "emmet_language_server",
          "jsonls",
          "terraformls",
          "rust_analyzer",
          "angularls",
          "svelte",
          "gopls",
          "helm_ls",
        },
      },
    },
    "saghen/blink.cmp",
    {
      "j-hui/fidget.nvim",
      event = "LspAttach",
      opts = {},
    },
    {
      "folke/neodev.nvim",
      opts = {
        library = {
          plugins = { "nvim-dap-ui" },
          types = true,
        },
      },
    },
  },
  keys = {
    { "<leader>i", function() vim.lsp.buf.format() end,         desc = "LSP format" },
    { "<leader>h", function() vim.lsp.buf.hover() end,          desc = "LSP hover" },
    { "gD",        function() vim.lsp.buf.declaration() end,    desc = "LSP declaration" },
    { "gd",        function() vim.lsp.buf.definition() end,     desc = "LSP definition" },
    { "gi",        function() vim.lsp.buf.implementation() end, desc = "LSP implementation" },
    { "gr",        function() vim.lsp.buf.references() end,     desc = "LSP references" },
    { "<F2>",      function() vim.lsp.buf.rename() end,         desc = "LSP rename" },
  },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP hover" })
      end,
    })

    vim.lsp.config.lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          telemetry = { enable = false },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    }
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("pyright")

    vim.lsp.config.clangd = {
      cmd = {
        "clangd",
        "--clang-tidy",
        "--background-index",
        "--completion-style=detailed",
      },
    }

    vim.lsp.enable("clangd")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("ocamllsp")
    vim.lsp.enable("cssls")
    vim.lsp.enable("emmet_language_server")
    vim.lsp.enable("jsonls")
    vim.lsp.enable("terraformls")
    vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("angularls")
    vim.lsp.enable("svelte")
    vim.lsp.enable("gopls")
    vim.lsp.enable("helm_ls")

  end,
}
