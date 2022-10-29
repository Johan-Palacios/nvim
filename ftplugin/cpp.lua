if vim.fn.has('wsl') == 1 then
  -- require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp' } })
  local dap = require('dap')
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = vim.env.HOME .. "/" ..
        ".local/share/nvim/mason/bin/OpenDebugAD7",
    -- setupCommands = {
    --   {
    --     text = '-enable-pretty-printing',
    --     description = 'enable pretty printing',
    --     ignoreFailures = false
    --   },
    -- },
  }
  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopAtEntry = true,
    }
  }
end
