local Terminal = require("toggleterm.terminal").Terminal

local notify_filter = vim.notify

vim.notify = function(msg, ...)
  if msg:match "warning: multiple different client offset_encodings detected for buffer, this is not supported yet" then
    return
  end
  notify_filter(msg, ...)
end

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
    vim.cmd "startinsert"
  end,
  count = 5,
}

function _C_TERM()
  vertical_term:toggle(15)
end

vim.api.nvim_set_keymap("n", "<m-4>", "<cmd>lua _C_TERM()<CR>", { noremap = true, silent = true })

local status_dap, dap = pcall(require, "dap")
if not status_dap then
  return
end

dap.adapters.lldb = {
  type = "executable",
  command = "lldb",
  name = "lldb",
}

dap.configurations.c = {
  {
    name = "graph_test",
    type = "lldb",
    request = "launch",
    program = "graph_test",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
  {
    name = "utils_test",
    type = "lldb",
    request = "launch",
    program = "utils_test",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
  {
    name = "net_test",
    type = "lldb",
    request = "launch",
    program = "net_test",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
  {
    name = "testapp",
    type = "lldb",
    request = "launch",
    program = "testapp",
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    initCommands = { "settings set target.input-path testapp-debug" },
  },
}

dap.configurations.c = dap.configurations.cpp
