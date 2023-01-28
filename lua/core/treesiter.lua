local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.motoko = "typescript"

configs.setup {
  ensure_installed = {},
  sync_install = false,
  ignore_install = { "" },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "" },
    -- additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  matchup = {
    enable = true,
  },
  playground = {
    enable = false,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
    colors = {
      "#d19a66",
      "#c678dd",
      "#56b6c2",
      "#d19a66",
      "#c678dd",
      "#56b6c2",
    },
    disable = { "html" },
  },
}
