local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local props = {
  layout_config = {
    width = function(_, max_columns, _)
      return math.min(max_columns, 80)
    end,
    height = function(_, _, max_lines)
      return math.min(max_lines, 15)
    end,
  },
  previewer = false,
}

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
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  extensions_list = { "themes", "terms", "projects" },
  extensions = {
    ["ui-select"] = props,
    "projects",
  },
}

telescope.load_extension "projects"
telescope.load_extension "ui-select"

local status_builtin, builtin = pcall(require, "telescope.builtin")
if not status_builtin then
  return
end

local keymap = require("core.functions").keymap

keymap("n", "<Leader>ff", builtin.find_files, "Find Words")
keymap("n", "<Leader>fw", function()
  builtin.live_grep()
end, "Find Words")
keymap("n", "<Leader>fb", builtin.buffers, "Find Buffers")
keymap("n", "<Leader>fh", builtin.help_tags, "Find Help")
keymap("n", "<C-p>", function()
  builtin.find_files(props)
end, "Find Files")
keymap("n", "<leader>fc", function()
  builtin.commands(props)
end, "Find Command")
keymap("n", "gr", function()
  builtin.lsp_references()
end, "Find References")
keymap("n", "gi", function()
  builtin.lsp_implementations()
end, "Find Implementations")
