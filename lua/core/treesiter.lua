local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {},
  sync_install = false,
  ignore_install = { "" },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = { "" },
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
    disable = { "html", "xml" },
  },
}
vim.treesitter.language.register("bash", "zsh")
