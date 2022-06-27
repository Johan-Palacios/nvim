local status_ok, todo = pcall(require, "todo-comments")
if not status_ok then
  return
end
todo.setup {
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }
    },
    TODO = {
      icon = " ",
      color = "info"
    },
    HACK = {
      icon = " ",
      color = "warning"
    },
    WARN = {
      icon = " ",
      color = "warning",
      alt = { "WARNING", "XXX" }
    },
    PERF = {
      icon = " ",
      alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" }
    },
    NOTE = {
      icon = " ",
      color = "hint",
      alt = { "INFO" }
    }
  },
  merge_keywords = true,
  highlight = {
    before = "fg",
    keyword = "wide",
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 400,
    exclude = {}
  },
  colors = {
    error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
    warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
    info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
    hint = { "LspDiagnosticsDefaultHint", "#10B981" },
    default = { "Identifier", "#7C3AED" }
  },
  search = {
    command = "rg",
    args = {
      "--color=never", "--no-heading", "--with-filename", "--line-number",
      "--column"
    },
    pattern = [[\b(KEYWORDS)\b]]
  }
}
