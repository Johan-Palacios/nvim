local status_saga, lspsaga = pcall(require, "lspsaga")
if not status_saga then
  return
end

lspsaga.setup {
  lightbulb = {
    enable = false,
  },
  symbol_in_winbar = {
    enable = false,
  },
  code_action = {
    num_shortcut = true,
    keys = {
      quit = "q",
      exec = "<CR>",
    },
  },
  ui = {
    theme = "round",
    border = "rounded",
    winblend = 0,
    expand = "",
    collapse = "",
    preview = "﬘ ",
    code_action = "  ",
    diagnostic = " ",
    incoming = " ",
    outgoing = " ",
  },
}
