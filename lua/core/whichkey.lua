require("which-key").setup({
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
})
local wk = require("which-key")
wk.register({
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
    f = { "<cmd>ToggleTerm<cr>", "Floating Terminal" },
    v = { '<cmd>ToggleTerm direction="vertical<cr>"', "Terminal Vertial" },
    h = {
      '<cmd>ToggleTerm size=10 direction="horizontal"<cr>',
      "Terminal Horizontal",
    },
  },
  h = {
    name = "Gitsigns ",
  },
  b = {
    name = "Buffers ",
    d = { "<cmd>Bdelete<cr>", "Delete Buffer" },
    v = { "<cmd>vsp<cr>", "Vertical Split" },
    h = { "<cmd>split<cr>", "Horizontal Split" },
  },
  g = {
    name = "Git Options ",
    s = { "<cmd>G<cr>", "Git" },
    m = { "<cmd><Plug>(git-messenger)<cr>", "Show git message" },
    d = { "<cmd>diffget //2", "cambios de la derecha" },
    i = { "<cmd>diffget //3", "cambios de la derecha" },
  },
  j = {
    name = "Jabs"
  },
  x = {
    name = "Execute"
  },
  l = {
    name = "LSP ",
    h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Docs" },
    p = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
      "Go To prev Diagnostic",
    },
    n = { "<cmd>lua vim.lsp.diagnostic.goto_next()", "Go To Next Diagnostic" },
  },
}, {
  prefix = "<leader>",
})
wk.register({
  name = "Search",
  ["/"] = {
    name = "Searching",
    r = {
      name = "Run Python",
    },
  },
}, {
  prefix = "/",
})
