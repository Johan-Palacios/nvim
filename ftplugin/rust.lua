local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end
local keymap = vim.keymap.set
local key_opts = { silent = true }

keymap("n", "<leader>rh", "<cmd>RustSetInlayHints<Cr>", key_opts)
keymap("n", "<leader>rhd", "<cmd>RustDisableInlayHints<Cr>", key_opts)
keymap("n", "<leader>th", "<cmd>RustToggleInlayHints<Cr>", key_opts)
keymap("n", "<leader>rr", "<cmd>RustRunnables<Cr>", key_opts)
keymap("n", "<leader>rem", "<cmd>RustExpandMacro<Cr>", key_opts)
keymap("n", "<leader>roc", "<cmd>RustOpenCargo<Cr>", key_opts)
keymap("n", "<leader>rpm", "<cmd>RustParentModule<Cr>", key_opts)
keymap("n", "<leader>rjl", "<cmd>RustJoinLines<Cr>", key_opts)
keymap("n", "<leader>rha", "<cmd>RustHoverActions<Cr>", key_opts)
keymap("n", "<leader>rhr", "<cmd>RustHoverRange<Cr>", key_opts)
keymap("n", "<leader>rmd", "<cmd>RustMoveItemDown<Cr>", key_opts)
keymap("n", "<leader>rmu", "<cmd>RustMoveItemUp<Cr>", key_opts)
keymap("n", "<leader>rsb", "<cmd>RustStartStandaloneServerForBuffer<Cr>", key_opts)
keymap("n", "<leader>rd", "<cmd>RustDebuggables<Cr>", key_opts)
keymap("n", "<leader>rv", "<cmd>RustViewCrateGraph<Cr>", key_opts)
keymap("n", "<leader>rw", "<cmd>RustReloadWorkspace<Cr>", key_opts)
keymap("n", "<leader>rss", "<cmd>RustSSR<Cr>", key_opts)
keymap("n", "<leader>rxd", "<cmd>RustOpenExternalDocs<Cr>", key_opts)

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  L = {
    name = "Rust",
    h = { "<cmd>RustToggleInlayHints<Cr>", "Toggle Hints" },
    r = { "<cmd>RustRunnables<Cr>", "Runnables" },
    -- r = { "<cmd>lua _CARGO_RUN()<cr>", "Cargo Run" },
    t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
    m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
    c = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
    p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
    -- j = { "<cmd>RustJoinLines<Cr>", "Join Lines" },
    -- s = { "<cmd>RustStartStandaloneServerForBuffer<Cr>", "Start Server Buf" },
    d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
    v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
    R = {
      "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
      "Reload Workspace",
    },
    -- S = { "<cmd>RustSSR<Cr>", "SSR" },
    -- o = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs" },
    -- h = { "<cmd>RustSetInlayHints<Cr>", "Enable Hints" },
    -- H = { "<cmd>RustDisableInlayHints<Cr>", "Disable Hints" },
    -- a = { "<cmd>RustHoverActions<Cr>", "Hover Actions" },
    -- a = { "<cmd>RustHoverRange<Cr>", "Hover Range" },
    -- j = { "<cmd>RustMoveItemDown<Cr>", "Move Item Down" },
    -- k = { "<cmd>RustMoveItemUp<Cr>", "Move Item Up" },
  },
}

which_key.register(mappings, opts)

local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if msg:match "message with no corresponding" then
    return
  end

  notify_filter(msg, ...)
end
local Terminal = require("toggleterm.terminal").Terminal
local vertical_term = Terminal:new {
  cmd = "cargo run",
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
      "<cmd>4ToggleTerm size=60 direction=horizontal<cr>",
      { noremap = true, silent = true }
    )
  end,
  on_close = function(term)
    vim.cmd("Closing terminal")
  end,
  count = 4,
}

function _CARGO_TERM()
  vertical_term:toggle(15)
end

vim.api.nvim_set_keymap("n", "<m-4>", "<cmd>lua _CARGO_TERM()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<m-4>", "<cmd>lua _CARGO_TERM()<CR>", { noremap = true, silent = true })
