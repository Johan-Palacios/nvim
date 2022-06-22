local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")
telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-s>"] = actions.select_vertical,
			},
		},
	},
})
telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
    -- borderchars = { "", "│", "", "│", "╭", "╮", "╯", "╰" },
		prompt_prefix = "❯ ",
		selection_caret = "❯ ",
		sorting_strategy = "ascending",
		color_devicons = true,
		layout_config = {
			prompt_position = "top",
			horizontal = {
				width_padding = 0.04,
				height_padding = 0.1,
				preview_width = 0.6,
			},
			vertical = {
				width_padding = 0.05,
				height_padding = 1,
				preview_height = 0.5,
			},
		},
	},
})
