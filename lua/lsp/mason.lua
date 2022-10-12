local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local servers = { "jsonls", "sumneko_lua", "pyright", "omnisharp", "html", "cssls", "vimls", "rust_analyzer", "cmake",
  "clangd", "tsserver", "emmet_ls"}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("lsp.handler").on_attach,
    capabilities = require("lsp.handler").capabilities,
  }

  local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end


  if server == "rust_analyzer" then
    local rust_opts = require "lsp.settings.rust_analyzer"
    local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
    if not rust_tools_status_ok then
      return
    end
    rust_tools.setup(rust_opts)
    goto continue
  end
  lspconfig[server].setup(opts)
  ::continue::
end