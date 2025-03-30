local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "󰌶" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  local config = {
    virtual_text = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = signs[1].text,
        [vim.diagnostic.severity.WARN] = signs[2].text,
        [vim.diagnostic.severity.HINT] = signs[3].text,
        [vim.diagnostic.severity.INFO] = signs[4].text,
      },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
      format = function(d)
        local code = d.code or (d.user_data and d.user_data.lsp.code)
        if code then
          return string.format("%s", d.message):gsub("1. ", "")
        end
        return d.messagehan
      end,
    },
    document_highlight = false,
    code_lens_refresh = true,
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "●",
    },
  })
end

local function lsp_keymaps(bufnr)
  local keymap = require("core.functions").keymap_buf
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd> lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  keymap("n", "gl", function()
    vim.diagnostic.open_float()
  end, "Show Diagnostic")
  keymap("n", "gn", function()
    vim.diagnostic.goto_next()
  end, "Go Next", bufnr)
  keymap("n", "gp", function()
    vim.diagnostic.goto_next()
  end, "Go Prev", bufnr)
  vim.api.nvim_create_user_command("Format", function()
    vim.lsp.buf.format { async = true }
  end, {})
  keymap("n", "R", function()
    vim.lsp.buf.rename()
  end, "Rename", bufnr)
  keymap({ "v", "n" }, "ga", function()
    vim.lsp.buf.code_action()
  end, "Code Action", bufnr)
end

local function lsp_highlight_document(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    local group = vim.api.nvim_create_augroup("LSPDocumentHighlight", {})

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved" }, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end
end

M.on_attach = function(client, bufnr)
  lsp_highlight_document(client, bufnr)
  lsp_keymaps(bufnr)

  if client.supports_method "textDocument/documentSymbol" then
    require("nvim-navic").attach(client, bufnr)
  end

  -- Range Formating
  -- local function buf_set_option(...)
  --   vim.api.nvim_set_option_value(bufnr, ...)
  -- end
  --
  -- buf_set_option("formatexpr", "v:lua.vim.lsp.formatexpr(#{timeout_ms:250})")
  --

  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  -- if client.supports_method "textDocument/inlayHint" and (vim.fn.has "nvim-0.10" == 1) then
  --   vim.lsp.inlay_hint.enable()
  -- end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return M
