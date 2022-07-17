local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
  return
end

dap_install.setup {}

dap_install.config("python", {})
dap_install.config("ccppr_lldb", {})
-- add other configs here

dapui.setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 30,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console"
      },
      size = 20,
      position = "bottom",
    },
    -- floating = {
    --   max_height = nil, -- These can be integers or a float between 0 and 1.
    --   max_width = nil, -- Floats will be treated as percentage of your screen.
    --   border = "single", -- Border style. Can be "single", "double" or "rounded"
    --   mappings = {
    --     close = { "q", "<Esc>" },
    --   },
    -- },
    -- windows = { indent = 1 },
    -- render = {
    --   max_type_length = nil, -- Can be integer or nil.
    -- }
  },
}

-- dap.configurations.cpp = {
--
-- }
--

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
