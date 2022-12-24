local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-s>"] = actions.select_vertical,
      },
    },
  },
}
telescope.setup {
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
}

local status_builtin, builtin = pcall(require, "telescope.builtin")
if not status_builtin then
  return
end

vim.keymap.set("n", "<Leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Find Words" })
vim.keymap.set("n", "<Leader>fw", builtin.live_grep, { noremap = true, silent = true, desc = "Find Words" })
vim.keymap.set("n", "<Leader>fb", builtin.buffers, { noremap = true, silent = true, desc = "Find Buffers" })
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { noremap = true, silent = true, desc = "Find Help" })
vim.keymap.set("n", "<C-p>", function()
  builtin.find_files(require("telescope.themes").get_dropdown { previewer = false })
end, { noremap = true, silent = true, desc = "Find Files" })
vim.keymap.set("n", "<leader>fc", function()
  builtin.commands(require("telescope.themes").get_dropdown())
end, { noremap = true, silent = true, desc = "Find Command" })
