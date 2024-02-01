return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      { "nvim-treesitter/playground", event = "BufReadPre" },
      {
        "hiphish/rainbow-delimiters.nvim",
        event = "BufReadPre",
        config = function()
          vim.g.rainbow_delimiters = { blacklist = { "html", "xml", "markdown" } }
        end,
      },
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "BufReadPre",
        config = true,
      },
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

      ---@diagnostic disable-next-line: missing-fields
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
        matchup = {
          enable = true,
        },
        playground = {
          enable = false,
        },
        rainbow = {
          enable = true,
          disable = { "html", "xml", "markdown" },
        },
        disable = function(_, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      }
      vim.treesitter.language.register("bash", "zsh")
      vim.g.skip_ts_context_commentstring_module = true
    end,
    build = ":TSUpdate",
    event = "BufReadPre",
  },
}
