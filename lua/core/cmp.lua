local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- Funcion T
-- local function T(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
--
-- local has_words_before = function()
--   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
--     return false
--   end
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end


cmp.setup({
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local icons = require("kind.init").icons
      vim_item.kind = icons[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = "(LSP)",
        nvim_lua = "(Lua)",
        path = "(Path)",
        buffer = "(Buffer)",
        luasnip = "(snippet)",
        latex_symbols = "(Latex)",
      })[entry.source.name]
      vim_item.dup = ({
        buffer = 1,
        path = 1,
        nvim_lsp = 0,
        luasnip = 1,
      })[entry.source.name] or 0
      return vim_item
    end,
  },
  -- Prioridad
  -- sorting = {
  --   comparators = {
  --     cmp.config.compare.offset,
  --     cmp.config.compare.exact,
  --     cmp.config.compare.score,
  --     cmp.config.compare.kind,
  --     cmp.config.compare.sort_text,
  --     cmp.config.compare.length,
  --     cmp.config.compare.order,
  --   },
  -- },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },

  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  experimental = {
    native_menu = false,
    ghost_text = false,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    {
      name = "nvim_lsp",
    },
    {
      name = "path",
    },
    {
      name = "nvim_lua",
    },
    {
      name = "buffer",
    },
    {
      name = "luasnip",
    },
  },
})
