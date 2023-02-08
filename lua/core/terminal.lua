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
  -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  highlights = {
    Normal = {
      guifg = get_hl("Normal").fg,
      guibg = get_hl("Normal").bg,
    },
    NormalFloat = {
      link = 'Normal'
    },
    FloatBorder = {
      guibg = get_hl("Normal").bg,
      guifg = get_hl("FloatBorder").fg,
    },
  },
}

