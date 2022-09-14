return {
  cmd = {
    "clangd",
  },
  filetype = { "c", "cpp", "objc", "objcpp", "cuda" },
  init_options = {
    clangdFileStatus = true,
    semanticHighlighting = true,
  },
  clangdInlayHintsProvider = true,
  root_dir = {
    root_pattern(
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      'configure.ac',
      '.git'
    ),
  },
  single_file_support = false
}
