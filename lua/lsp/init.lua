local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("lsp.handler").setup()
require "lsp.mason"
require "lsp.null"
require "lsp.inlayhints"
