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
  replace = {
    key = {
      function(key)
        return require("which-key.view").format(key)
      end,

      { "<leader>", "SPC " },
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  win = {
    border = "rounded",
    no_overlap = true,
    padding = { 2, 2, 2, 2 },
    title = true,
    title_pos = "center",
    zindex = 1000,
    bo = {},
    wo = {
      winblend = 0,
    },
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
  show_help = false,
  show_hColorelp = true,
  triggers = {
    { "<auto>", mode = "nixsotc" },
    { "j", mode = { "i", "v" } },
    { "k", mode = { "i", "v" } },
  },
}

which_key.setup(setup)
which_key.add {
  mode = { "n" },
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
  { "<leader>b", group = "Buffers", nowait = true, remap = false },
  { "<leader>bd", desc = "Delete Buffer", nowait = true, remap = false },
  { "<leader>bh", "<cmd>split<cr>", desc = "Horizontal Split", nowait = true, remap = false },
  { "<leader>bv", "<cmd>vsp<cr>", desc = "Vertical Split", nowait = true, remap = false },
  { "<leader>c", group = "Conflict Manager ", nowait = true, remap = false },
  { "<leader>c0", desc = "Conflict None", nowait = true, remap = false },
  { "<leader>cb", desc = "Conflict Both", nowait = true, remap = false },
  { "<leader>co", desc = "Conflict Ours", nowait = true, remap = false },
  { "<leader>ct", desc = "Conflict Theirs", nowait = true, remap = false },
  { "<leader>d", group = "Debugger", nowait = true, remap = false },
  { "<leader>dO", desc = "Step Out", nowait = true, remap = false },
  { "<leader>db", desc = "Break Point  ", nowait = true, remap = false },
  { "<leader>dc", desc = "Continue ", nowait = true, remap = false },
  { "<leader>di", desc = "Step Into", nowait = true, remap = false },
  { "<leader>dl", desc = "Run last", nowait = true, remap = false },
  { "<leader>do", desc = "Step Over", nowait = true, remap = false },
  { "<leader>dr", desc = " Repl Toggle  ", nowait = true, remap = false },
  { "<leader>dt", desc = "Terminate Debugger ", nowait = true, remap = false },
  { "<leader>du", desc = " Toggle", nowait = true, remap = false },
  { "<leader>e", group = "Explorer", nowait = true, remap = false },
  { "<leader>f", group = "Files", nowait = true, remap = false },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files 🔎", nowait = true, remap = false },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find tags 📋", nowait = true, remap = false },
  { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find Words 📖", nowait = true, remap = false },
  { "<leader>g", group = "Git", nowait = true, remap = false },
  { "<leader>g0", desc = "Confict none", nowait = true, remap = false },
  { "<leader>gb", desc = "Conflict Both", nowait = true, remap = false },
  { "<leader>gn", desc = "Confict Next", nowait = true, remap = false },
  { "<leader>go", desc = "Conflict Ours", nowait = true, remap = false },
  { "<leader>gp", desc = "Conflict Prev", nowait = true, remap = false },
  { "<leader>gt", desc = "Conflict Theirs", nowait = true, remap = false },
  { "<leader>j", group = "Jabs ", nowait = true, remap = false },
  { "<leader>l", group = "LSP", nowait = true, remap = false },
  { "<leader>n", group = " Clean Search", nowait = true, remap = false },
  { "<leader>s", group = "Replace", nowait = true, remap = false },
  { "<leader>t", group = "Terminal", nowait = true, remap = false },
  { "<leader>tf", desc = "Floating Terminal", nowait = true, remap = false },
  { "<leader>tg", desc = "Terminal Lazy Git", nowait = true, remap = false },
  { "<leader>th", desc = "Terminal Horizontal", nowait = true, remap = false },
  { "<leader>tt", desc = "Terminal Tab", nowait = true, remap = false },
  { "<leader>tv", desc = "Terminal Vertial", nowait = true, remap = false },
}

which_key.add {
  mode = { "n" },
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
  { "gD", desc = "Go Declaration", nowait = true, remap = false },
  { "gI", desc = "Go Implementations", nowait = true, remap = false },
  { "ga", desc = "Go Action", nowait = true, remap = false },
  { "gd", desc = "Go definition", nowait = true, remap = false },
  { "gq", desc = "Go Diagnostigcs List", nowait = true, remap = false },
  { "gr", desc = "Go References", nowait = true, remap = false },
}
