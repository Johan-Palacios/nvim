if vim.fn.has('wsl') == 1 then
  -- VSCODE extensions
  require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })
  -- CPPTOOLS DAP DEBUGER
  local dap = require('dap')
  dap.adapters.cppdbg = {
    name = 'cppdbg',
    id = 'cppdbg',
    type = 'executable',
    command = vim.env.HOME ..
        '/' .. '.vscode-server/extensions/ms-vscode.cpptools-1.11.2-linux-x64/debugAdapters/bin/OpenDebugAD7',
    options = {
      detached = false
    },
    setupCommands = {
      {
        text = '-enable-pretty-printing',
        description = 'enable pretty printing',
        ignoreFailures = false
      },
    },
  }

  dap.configurations.cpp = {
    {
      name = 'Launch',
      type = 'cppdbg',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
    },
  }
end
