local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

local codelldb_adapter = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
    detached = false,
  },
}

dap.adapters.codelldb = codelldb_adapter

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    -- program = function()
    --   return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    -- end,
    program = function()
      local path
      vim.ui.input({ prompt = "Path to executable: ", default = vim.loop.cwd() }, function(input)
        path = input
      end)
      vim.cmd [[redraw]]
      return path
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
