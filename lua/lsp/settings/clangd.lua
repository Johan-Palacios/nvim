return {
  cmd = {
    "clangd",
  },
  clangdInlayHintsProvider = true,
  filetype = { "c", "cpp", "objc", "objcpp", "cuda" },
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
