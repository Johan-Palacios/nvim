return {
  -- LANGUAGE TOOL
  { "simrat39/rust-tools.nvim", ft = "rust" },
  { "mfussenegger/nvim-jdtls", ft = "java" },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "cuda" },
    config = function()
      require("clangd_extensions.config").setup {}
      require("clangd_extensions.ast").init()
      vim.cmd [[
        command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
        command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
        command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
        command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
        command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
      ]]
      --   local status_ok, project_config = pcall(require, "rhel.clangd_wrl")
      --   if status_ok then
      --     clangd_flags = vim.tbl_deep_extend("keep", project_config, clangd_flags)
      --   end
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    lazy = true,
    ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    config = function()
      require("typescript").setup {}
    end,
  },
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
