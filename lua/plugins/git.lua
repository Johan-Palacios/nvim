return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    opts = {

      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "┃" },
        untracked = { text = "┆" },
      },
      signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "┃" },
        untracked = { text = "┆" },
      },
      signs_staged_enable = true,
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      sign_priority = 4,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
  },
  { "tpope/vim-fugitive", event = "VeryLazy" },
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
  },
}
