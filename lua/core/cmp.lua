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
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

---Ignore files
---@return boolean
local ignore_typefile = function()
  local ignore = { "java" }
  for _, value in ipairs(ignore) do
    return vim.bo.filetype == value
  end
  return false
end

---Return improved Menu
---@param menu string (`vim_item.menu`)
---@param entry table (`entry`)
---@return string
local improved_menu = function(menu, entry)
  if ignore_typefile() then
    entry.completion_item.detail = ""
  end
  -- Get Path
  if
    entry.completion_item.detail ~= nil
    and entry.completion_item.detail ~= ""
    and entry.completion_item.detail ~= "Auto-import"
  then
    return "\t" .. entry.completion_item.detail
  end
  -- Get default menu
  if menu ~= nil then
    return "\t" .. menu
  end
  return ""
end

local icons = require "core.icons"

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6cc644" })

local kind_icons = icons.kind

cmp.setup {
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  formatting = {
    max_width = 0,
    fields = { "kind", "abbr", "menu" },
    expandable_indicator = true,
    format = function(entry, vim_item)
      local max_width = 30
      vim_item.kind = kind_icons[vim_item.kind]
      if entry.source.name == "copilot" then
        vim_item.kind = icons.git.Octoface
        vim_item.kind_hl_group = "CmpItemKindCopilot"
      end
      vim_item.menu_hl_group = "Comment"
      local menu = improved_menu(vim_item.menu, entry)
      vim_item.menu = ({
        nvim_lsp = "(LSP)" .. menu,
        nvim_lua = "(Lua)",
        path = "(Path)",
        buffer = "(Buffer)",
        luasnip = "(Snippet)",
        latex_symbols = "(Latex)",
      })[entry.source.name]
      vim_item.dup = ({
        buffer = 1,
        path = 1,
        nvim_lsp = 0,
        luasnip = 1,
      })[entry.source.name] or 0
      -- Reduce menu
      if max_width ~= 0 and #vim_item.abbr > max_width then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width + 10) .. icons.ui.Ellipsis
      end
      if max_width ~= 0 and #vim_item.menu > max_width then
        vim_item.menu = string.sub(vim_item.menu, 1, max_width) .. " " .. icons.ui.Ellipsis
      end
      return vim_item
    end,
  },
  window = {
    documentation = false,
    -- documentation = {
    --   border = "rounded",
    --   winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    -- },
    completion = {
      border = "rounded",
      -- winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  experimental = {
    ghost_text = false,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<CR>"] = cmp.mapping.confirm { select = true },
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
      entry_filter = function(entry, ctx)
        local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
        if kind == "Snippet" and ctx.prev_context.filetype == "java" then
          return false
        end
        if kind == "Text" then
          return false
        end
        return true
      end,
    },
    --[[ { ]]
    --[[   name = "copilot", ]]
    --[[   max_item_count = 3, ]]
    --[[   trigger_characters = { ]]
    --[[     { ".", ":", "(", "'", '"', "[", ",", "#", "*", "@", "|", "=", "-", "{", "/", "\\", "+", "?" }, ]]
    --[[   }, ]]
    --[[   group_index = 2, ]]
    --[[ }, ]]
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
  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}
