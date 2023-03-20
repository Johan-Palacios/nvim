return {
  -- LANGUAGE TOOL
  { "simrat39/rust-tools.nvim", ft = "rust" },
  { "mfussenegger/nvim-jdtls", ft = "java" },
  { "p00f/clangd_extensions.nvim", ft = { "cpp", "c" } },
  { "jose-elias-alvarez/typescript.nvim", event = "VeryLazy"},
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.g.vimtex_compiler_latexmk = {
        build_dir = ".out",
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-interaction=nonstopmode",
          "-synctex=1",
        },
      }
      vim.g.vimtex_view_method = "general"
    end,
  },
}
