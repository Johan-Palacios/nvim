local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  key_labels = {
    ["<leader>"] = "SPC ",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
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
  show_help = false,
  show_hColorelp = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local s_opts = {
  mode = "n",
  prefix = "/",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local n_mapings = {
  d = {
    name = "Debugger ",
    b = "Break Point ",
    c = "Continue ",
    r = "Repl Toggle ",
    i = "Step Into 樂",
    l = "Run last ",
    O = "Step Out ﬀ",
    o = "Step Over",
    t = "Terminate Debugger 栗",
    u = "Toggle ",
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
    o = { "Conflict Ours" },
    b = { "Conflict Both" },
    t = { "Conflict Theirs" },
    ["0"] = { "Confict none" },
    p = { "Conflict Prev" },
    n = { "Confict Next" },
  },
  j = {
    name = "Jabs ",
  },
  l = {
    name = "LSP ",
    a = { "LSP Saga Code Action" },
    f = { "LSP Saga Find" },
    d = { "LSP Saga Definition Preview" },
    r = { "LSP Saga Rename" },
    R = { "LSP Rename" },
  },
  s = {
    name = "Replace",
  },
}

local s_mappings = {
  name = "Search",
  ["/"] = {
    name = "Searching",
  },
}

which_key.setup(setup)
which_key.register(n_mapings, opts)
which_key.register(s_mappings, s_opts)
