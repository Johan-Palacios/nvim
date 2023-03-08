return {
  -- LANGUAGE TOOL
  { "simrat39/rust-tools.nvim", event = "VeryLazy" },
  { "mfussenegger/nvim-jdtls", event = "VeryLazy" },
  { "p00f/clangd_extensions.nvim", event = "VeryLazy" },
  { "jose-elias-alvarez/typescript.nvim", event = "VeryLazy" },
  {
    "lervag/vimtex",
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
      -- vim.g.vimtex_view_general_viewer = "okular"
      -- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
      vim.g.vimtex_view_method = "general"
    end,
  },
}
