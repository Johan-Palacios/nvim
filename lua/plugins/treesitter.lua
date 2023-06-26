return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "nvim-treesitter/playground", event = "BufReadPre" },
      { "HiPhish/nvim-ts-rainbow2", event = "BufReadPre" },
      { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufReadPre" },
      { "windwp/nvim-ts-autotag", event = "InsertEnter" },
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
      "windwp/nvim-ts-autotag",
    },
    config = function()
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
          disable = { "html", "xml" },
        },
      }
      vim.treesitter.language.register("bash", "zsh")
    end,
    build = ":TSUpdate",
    event = "BufReadPre",
  },
}
