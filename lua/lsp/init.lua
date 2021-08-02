vim.o.completeopt = "menuone,noselect"
local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"
require "lspinstall".setup()
require "lspinstall".installed_servers()

require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = true,
        buffer = true,
        -- calc = true,
        -- vsnip = true,
        nvim_lsp = true,
        nvim_lua = true,
        spell = true,
        -- tags = true,
        -- snippets_nvim = true,
        treesitter = true
        -- tabnine = true
    }
}
local M = {}

M.snippets = function()
    local ls = require("luasnip")

    ls.config.set_config(
        {
            history = true,
            updateevents = "TextChanged,TextChangedI"
        }
    )
    require("luasnip/loaders/from_vscode").load()
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--Emmet function
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lspconfig.emmet_ls then
    configs.emmet_ls = {
        default_config = {
            cmd = {"emmet-ls", "--stdio"},
            filetypes = {"html", "css"},
            root_dir = function(fname)
                return vim.loop.cwd()
            end,
            settings = {}
        }
    }
end
-- require "lspconfig".kite.setup {
--     cmd = {"~/.local/share/kite/current/kite-lsp", "--stdio"},
--     filetypes = {"php", "python", "javascript", "go"}
-- }
require "lspconfig".omnisharp.setup {}
require "lspconfig".pyright.setup {}
require "lspconfig".bashls.setup {}
-- require'lspconfig'.html.setup{}
require "lspconfig".clangd.setup {}
require "lspconfig".tsserver.setup {}
require "lspconfig".cssls.setup {}
require "lspconfig".vuels.setup {}
require "lspconfig".sumneko_lua.setup {}
require "lspconfig".intelephense.setup {}
require "lspconfig".java_language_server.setup {}
require "lspconfig".emmet_ls.setup {capabilities = capabilities}
return M