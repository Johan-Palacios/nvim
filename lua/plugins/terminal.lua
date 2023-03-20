return {
  {
    "akinsho/nvim-toggleterm.lua",
    cmd = {
      "ToggleTerm",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
      "ToggleTermSetName",
      "ToggleTermToggleAll",
    },
    keys = {
      {
        "<Leader>tf",
        ':ToggleTerm direction="float"<CR>',
        mode = { "n" },
        silent = true,
        noremap = true,
      },
      {
        "<Leader>tv",
        ':ToggleTerm direction="vertical"<CR>',
        mode = { "n" },
        silent = true,
        noremap = true,
      },
      {
        "<Leader>th",
        ':ToggleTerm direction="horizontal" size=10<CR>',
        silent = true,
        noremap = true,
        mode = { "n" },
      },
      {
        "<Leader>tt",
        ':ToggleTerm direction="tab" size=10<CR>',
        mode = { "n" },
        silent = true,
        noremap = true,
      },
      {
        "<leader>tg",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new { cmd = "lazygit", hidden = true, direction = "float" }
          lazygit:toggle()
        end,
        mode = { "n" },
        silent = true,
        noremap = true,
      },
    },
    config = function()
      local status_ok, term = pcall(require, "toggleterm")
      if not status_ok then
        return
      end

      local get_hl = require("core.functions").get_hlgroup

      term.setup {
        size = 50,
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 3,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        highlights = {
          Normal = {
            guifg = get_hl("Normal").fg,
            guibg = get_hl("Normal").bg,
          },
          NormalFloat = {
            link = "Normal",
          },
          FloatBorder = {
            guibg = get_hl("Normal").bg,
            guifg = get_hl("FloatBorder").fg,
          },
        },
      }
    end,
  },
}
