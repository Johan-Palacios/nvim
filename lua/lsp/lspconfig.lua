local border = {
    {"╭", "floatborder"}, {"▔", "floatborder"}, {"╮", "floatborder"},
    {"▕", "floatborder"}, {"╯", "floatborder"}, {"▁", "floatborder"},
    {"╰", "floatborder"}, {"▏", "floatborder"}
}
local on_attach = function(client, bufnr)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                                                 vim.lsp.handlers.hover, {
            border = border
        })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = border
        })
end
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.documentationFormat = {"markdown", "plaintext"}
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = {valueSet = {1}}
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits"
    }
  }
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
  return {capabilities = capabilities, on_attach = on_attach}
end


local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local config = make_config()
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = "LuaJIT",
      path = vim.split(package.path, ";")
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {"vim"}
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
      }
    }
  }
}
local lspconfig = require "lspconfig"
local ts_utils_settings = {
  -- debug = true,
  import_all_scan_buffers = 100,
  update_imports_on_move = true,
  filter_out_diagnostics_by_code = {80001}
}

lsp_installer.on_server_ready(
  function(server)
    local opts = {config}
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server.name == "sumneko_lua" then
      opts.settings = lua_settings
      print("Sumnekolua")
    elseif server.name == "tsserver" then
      local ts_utils = require("nvim-lsp-ts-utils")
      opts.init_options = ts_utils.init_options
      opts.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client, bufnr)
        ts_utils.setup(ts_utils_settings)
        ts_utils.setup_client(client)
      end
      opts.filetypes = {
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "typescript.jsx",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "javascript.tsx"
      }
      opts.root_dir = function()
        return vim.loop.cwd()
      end
      -- require("null-ls").config({})
      -- lspconfig["null-ls"].setup({on_attach = on_attach})
    elseif server.name == "gopls" then
      -- opts.settings = {
      --   go = {
      --     -- cmd = {vim.fn.expand("/home/edgardoyoliani/.local/share/nvim/lspinstall/go/gopls")},
      --     settings = {
      --       gopls = {
      --         analyses = {
      --           unusedparams = true
      --         },
      --         staticcheck = true
      --       }
      --     }
      --   }
      -- }
    elseif server.name == "php" then
      --[[
      opts.cmd = {"intelephense", "--stdio"}
      opts.intelephense = {
        stubs = {
          "bcmath",
          "bz2",
          "calendar",
          "Core",
          "curl",
          "zip",
          "zlib",
          "wordpress",
          "woocommerce",
          "acf-pro",
          "wordpress-globals",
          "wp-cli",
          "genesis",
          "polylang"
        },
        files = {
          maxSize = 5000000
        }
      }
        --]]
    elseif server.name == "diagnosticls" then
      opts.filetypes = {
        "javascript",
        "javascriptreact",
        "json",
        "typescript",
        "typescriptreact",
        "css",
        "less",
        "scss",
        "markdown",
        "pandoc"
      }
      opts.init_options = {
        lintrs = {
          eslint = {
            command = "eslint_d",
            rootPatterns = {".git"},
            debounce = 100,
            args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
            sourceName = "eslint_d",
            parseJson = {
              errorsRoot = "[0].messages",
              line = "line",
              column = "column",
              endLine = "endLine",
              endColumn = "endColumn",
              message = "[eslint] ${message} [${ruleId}]",
              security = "severity"
            },
            securities = {
              [2] = "error",
              [1] = "warning"
            }
          }
        },
        filetypes = {
          javascript = "eslint",
          javascriptreact = "eslint",
          typescript = "eslint",
          typescriptreact = "eslint"
        },
        formatters = {
          eslint_d = {
            command = "eslint_d",
            args = {"--stdin", "--stdin-filename", "%filename", "--fix-to-stdout"},
            rootPatterns = {".git"}
          },
          prettier = {
            command = "prettier",
            args = {"--stdin-filepath", "%filename"}
          }
        },
        formatFiletypes = {
          css = "prettier",
          javascript = "eslint_d",
          javascriptreact = "eslint_d",
          json = "prettier",
          scss = "prettier",
          less = "prettier",
          typescript = "eslint_d",
          typescriptreact = "eslint_d",
          markdown = "prettier"
        }
      }
    elseif server.name == "rust_analyzer" then
      opts.settings = {
        ["rust-analyzer"] = {
          assist = {
            importMergeBehavior = "last",
            importPrefix = "by_self"
          },
          diagnostics = {
            disabled = {"unresolved-import"}
          },
          cargo = {
            loadOutDirsFromCheck = true
          },
          procMacro = {
            enable = true
          },
          checkOnSave = {
            command = "clippy"
          },
          root_dir = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json") or lspconfig.util.find_git_root
        }
      }
    end
    server:setup(opts)
  end
)
