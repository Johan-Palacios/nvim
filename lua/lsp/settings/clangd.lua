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
  single_file_support = false,
}
