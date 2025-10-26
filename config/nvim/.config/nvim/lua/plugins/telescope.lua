-- Telescope configuration

require('telescope').setup {
	pickers = {
		find_files = {
			theme = "ivy",
			disable_devicons = false,
			previewer = false,
			winblend = 10,
			layout_config = {
				height = 0.4
			}
		},
		live_grep = {
			theme = "ivy",
			disable_devicons = false,
			winblend = 10,
			layout_config = {
				height = 0.4
			}
		},
		treesitter = {
			theme = "ivy",
			disable_devicons = true,
			winblend = 10,
			layout_config = {
				height = 0.4
			}
		},
		lsp_references = { theme = "ivy", disable_devicons = true, previewer = false },
		grep_string = { theme = "ivy", disable_devicons = true },
		buffers = { theme = "ivy", disable_devicons = true },
		help_tags = { theme = "ivy", disable_devicons = true },
	},
	extensions = {
		fzf = {
			fuzzy = true,                   -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true,    -- override the file sorter
			case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}
require('telescope').load_extension('fzf')
