local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local feedkey = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

local luasnip = require("luasnip")
local cmp = require'cmp'
cmp.setup({
snippet = {
    expand = function(args)
    require('luasnip').lsp_expand(args.body)
    end,
},
completion = {
    completeopt = 'menu,menuone,noinsert',
  },
formatting = {
    format = function(entry, vim_item)
    -- vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
    local icons = require("pg-lspkind.init").icons
    vim_item.kind = icons[vim_item.kind]
    vim_item.menu = ({
      buffer = "(Buffer)",
      nvim_lsp = "(LSP)",
      luasnip = "(Snippet)",
      nvim_lua = "(Lua)",
      latex_symbols = "[Latex]",
    })[entry.source.name]
    return vim_item
  end,
},
documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        feedkey("<C-p>")
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
},
sources = {
    { name = 'nvim_lsp' },

    -- -- For vsnip user.
    -- { name = 'vsnip' },

    -- For luasnip user.
    { name = 'luasnip' },

    -- For ultisnips user.
    -- { name = 'ultisnips' },

    { name = 'buffer' },
}
})
