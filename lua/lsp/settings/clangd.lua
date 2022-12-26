return {
  cmd = {
    "clangd",
    "--background-index",
    "--fallback-style=Google",
    "--all-scopes-completion",
    "--clang-tidy",
    "--log=error",
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--pch-storage=memory", -- could also be disk
    "--folding-ranges",
    "--enable-config", -- clangd 11+ supports reading from .clangd configuration file
  },
  filetype = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_dir = {
    root_pattern(
      ".clangd",
      ".clang-tidy",
      ".clang-format",
      "compile_commands.json",
      "compile_flags.txt",
      "configure.ac",
      ".git"
    ),
  },
  init_options = {
    clangdFileStatus = true,
    semanticHighlighting = true,
  },
  clangdInlayHintsProvider = true,
  single_file_support = false,
}
