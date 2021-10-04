local M = {}
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local function T(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local is_emmet_active = function()
    local clients = vim.lsp.buf_get_clients()

    for _, client in pairs(clients) do
        if client.name == "emmet_ls" then return true end
    end
    return false
end

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match("%s") == nil
end

local feedkey = function(key)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true),
                          "n", true)
end

local luasnip = require("luasnip")
local cmp = require 'cmp'

cmp.setup({
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
    },
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    -- completion = {
    --     completeopt = "menu,menuone,noinsert"
    -- },
    formatting = {
        format = function(entry, vim_item)
            -- vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
            local icons = require("pg-lspkind.init").icons
            vim_item.kind = icons[vim_item.kind]
            vim_item.menu = ({
                nvim_lsp = "(LSP)",
                nvim_lua = "(Lua)",
                path = "(Path)",
                buffer = "(Buffer)",
                luasnip = "(snippet)",
                -- spell = "(Spell)",
                -- cmp_tabnine = "(TN)",
                latex_symbols = "(Latex)"
                -- treesitter = "(Treesitter)"
            })[entry.source.name]
            vim_item.dup = ({
                buffer = 1,
                path = 1,
                nvim_lsp = 0
            })[entry.source.name] or 0
            return vim_item
        end
    },
    documentation = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
    },
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                feedkey("<C-n>")
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if vim.fn.pumvisible() == 1 then
                feedkey("<C-p>")
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    },
    sources = {
        {
            name = "nvim_lsp"
        }, {
            name = 'nvim_lua'
        }, {
            name = "buffer"
        }, {
            name = "spell"
        }, {
            name = "luasnip"
        }, {
            name = "path"
        }
    }
})

return M