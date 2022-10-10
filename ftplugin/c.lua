local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if msg:match "warning: multiple different client offset_encodings detected for buffer, this is not supported yet" then
    return
  end
  notify_filter(msg, ...)
end

local Terminal = require("toggleterm.terminal").Terminal
local vertical_term = Terminal:new {
  cmd = "cd build && make && ./main",
  close_on_exit = false,
  shell = vim.o.shell,
  direction = "horizontal",
  on_open = function(term)
    vim.cmd "startinsert!"
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "n",
      "<m-4>",
      "<cmd>4ToggleTerm size=15 direction=horizontal<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "t",
      "<m-4>",
      "<cmd>4ToggleTerm size=15 direction=horizontal<cr>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(
      term.bufnr,
      "i",
      "<m-4>",
      "<cmd>4ToggleTerm size=15 direction=horizontal<cr>",
      { noremap = true, silent = true }
    )
  end,
  on_close = function(term)
    vim.cmd("startinsert")
  end,
  count = 5,
}

function _C_TERM()
  vertical_term:toggle(15)
end

vim.api.nvim_set_keymap("n", "<m-4>", "<cmd>lua _C_TERM()<CR>", { noremap = true, silent = true })
