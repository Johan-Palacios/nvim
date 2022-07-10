local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua", "omnisharp", "html", "cssls", "vimls", "rust_analyzer",
  "pyright", "cmake", "tsserver", "clangd"}

lsp_installer.setup {
  ensure_installed = servers,
  ui = {
    border = "rounded",
  }
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
