return {
  -- LANGUAGE TOOL
  { "simrat39/rust-tools.nvim", ft = "rust" },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function ()
      require("typescript-tools").setup {
      on_attach = function(client, bufnr)
        require("lsp.handler").on_attach(client, bufnr)
      end

      }



    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "cuda" },
    config = function()
      require("clangd_extensions").setup()
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
