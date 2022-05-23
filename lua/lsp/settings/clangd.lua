return {
  cmd = { "clangd" },
  filetype = { "c", "cpp", "objc", "objcpp" },
  root_dir = {
    root_pattern(
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      'configure.ac',
      '.git'
    )
  },
  single_file_support = {true}
}
