-- LSP config

-- Get LSP capabilities
-- Get additional capabilities from blink
local capabilities = require("blink.cmp").get_lsp_capabilities()
-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Define keymaps to be set when LSP attaches to a buffer
local set_lsp_keymap = function()
  -- Add keymap when attach with pyright (only inside the current buffer)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
end

-- Setup lspconfig
vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = set_lsp_keymap,
})

-- Lua LSP server setup
vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      telemetry = { enable = false },
      workspace = { checkThirdParty = false },
    },
  }
}
vim.lsp.enable("lua_ls")

-- Python LSP server setup
vim.lsp.enable("pyright")

-- C/C++ LSP server setup
vim.lsp.enable("clangd")
vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--clang-tidy",                -- enable clang-tidy diagnostics
    "--background-index",          -- index project code in the background and persist index on disk
    "--completion-style=detailed", -- granularity of code completion suggestions: bundled, detailed
  },
}

-- Others
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
