return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- Required so the catppuccin lualine theme is on rtp before lualine.setup.
    "catppuccin/nvim",
  },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "catppuccin-mocha",
      component_separators = { "", "" },
      section_separators = { "", "" },
    },
    sections = {
      lualine_a = { { "filename", path = 2 } },
      lualine_b = { "branch", "diff" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { "hostname" },
      lualine_z = { "location" },
    },
  },
}
