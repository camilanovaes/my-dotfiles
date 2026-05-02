return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "*",
  event = "InsertEnter",
  opts = {
    keymap = {
      preset = "default",
      ["<Enter>"] = { "select_and_accept", "fallback" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    signature = { enabled = true },
  },
}
