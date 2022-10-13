require("which-key").setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  window = {
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
  },
  layout = {
    height = {
      min = 4,
      max = 25,
    },
    width = {
      min = 20,
      max = 50,
    },
    spacing = 10,
    align = "center",
  },
  ignore_missing = false,
  hidden = {
    "<silent>",
    "<cmd>",
    "<Cmd>",
    "<CR>",
    "call",
    "lua",
    "^:",
    "^ ",
    "<C>",
  },
  show_hColorelp = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}
local wk = require "which-key"
wk.register({
  d = {
    name = "Debugger ",
    b = "Break Point ",
    c = "Continue ",
    r = " Repl Toggle ",
    i = "Step Into 樂",
    l = "Run last ",
    O = "Step Out ﬀ",
    o = "Step Over",
    t = "Terminate Debugger 栗",
    u = "DAP Toggle ",
  },
  c = {
    name = "Conflict Manager ",
    o = "Conflict Ours",
    t = "Conflict Theirs",
    b = "Conflict Both",
    ["0"] = "Conflict None",
  },
  q = {
    name = "Diagnostics",
  },
  f = {
    name = "Files ",
    f = { "<cmd>Telescope find_files<cr>", "Find Files 🔎" },
    w = { "<cmd>Telescope live_grep<cr>", "Find Words 📖" },
    h = { "<cmd>Telescope help_tags<cr>", "Find tags 📋" },
  },
  n = {
    name = "Clean Search ",
  },
  e = {
    name = "Explorer פּ",
  },
  t = {
    name = "Terminal ",
    f = { '<cmd>ToggleTerm direction="float"<cr>', "Floating Terminal" },
    v = { '<cmd>ToggleTerm direction="vertical"<cr>', "Terminal Vertial" },
    h = {
      '<cmd>ToggleTerm size=10 direction="horizontal"<cr>',
      "Terminal Horizontal",
    },
  },
  b = {
    name = "Buffers ",
    d = { "<cmd>Bdelete<cr>", "Delete Buffer" },
    v = { "<cmd>vsp<cr>", "Vertical Split" },
    h = { "<cmd>split<cr>", "Horizontal Split" },
  },
  g = {
    name = "Git ",
    s = { "Git " },
  },
  j = {
    name = "Jabs ",
  },
  l = {
    name = "LSP ",
    f = { "LSP Find" },
    d = { "LSP Definition Preview" },
    r = { "LSP Rename" },
    n = { "<cmd>lua vim.lsp.diagnostic.goto_next()", "LSP Go To Next Diagnostic" },
  },
}, {
  prefix = "<leader>",
})

wk.register({
  name = "Search",
  ["/"] = {
    name = "Searching",
  },
}, {
  prefix = "/",
})
