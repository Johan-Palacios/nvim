return {

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if not cmp_status_ok then
        return
      end

      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then
        return
      end

      ---Check backspace to improve Auto Complete
      ---@return boolean
      local check_backspace = function()
        ---@diagnostic disable-next-line: deprecated
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      ---Ignore files
      ---@return boolean
      local ignore_typefile = function()
        --Set ignore filetypes
        local ignore = { "java" }

        -- If the file type is equals to current filetype returns true
        for _, value in ipairs(ignore) do
          return vim.bo.filetype == value
        end

        return false
      end

      ---Enriched Menu with path and classes
      ---@param menu string (`vim_item.menu`)
      ---@param entry table (`cmp.entry`)
      ---@param lsptext string
      ---@return string
      local improved_menu = function(menu, entry, lsptext)
        -- Checks that the file is in the ignore list, set detail into a empty string
        if ignore_typefile() then
          entry.completion_item.detail = ""
        end

        -- Check the Item detal is not nil and not an empty string and not includes 'Auto-import' and return defaul
        -- item detail
        if
          entry.completion_item.detail ~= nil
          and entry.completion_item.detail ~= ""
          and entry.completion_item.detail ~= "Auto-import"
        then
          return "\t" .. entry.completion_item.detail
        end

        -- Check that the menu is not nil and set a default lsp item info
        if menu ~= nil then
          return lsptext .. "\t" .. menu
        end

        -- If all cases not match returns lsptext insted
        return lsptext
      end

      ---Reduce the lenght of the item, according to the `max_width`
      ---@param item string
      ---@param max_width integer
      ---@param icon_ellipsis string
      ---@return string
      local define_max_width = function(item, max_width, icon_ellipsis)
        -- Check if the max width is not 0 and item length is more than `max_width`
        if max_width ~= 0 and #item > max_width then
          return string.sub(item, 1, max_width) .. icon_ellipsis
        end

        -- If the length is less than max_width only return the normal text without ellipsis
        return item
      end

      -- Format menu to Aling with (LSP)
      -- local formatedmenu = function(menu, entry, max_width, text, icon)
      --   local textwidth = 10
      --   menu = improved_menu(menu, entry)
      --   if #menu >= max_width then
      --     return define_max_width(string.sub(menu, 1, max_width), textwidth, icon) .. " " .. text
      --   end
      --   if #menu < max_width then
      --     local fillchars = max_width - #menu
      --     return define_max_width(menu .. string.rep(" ", fillchars), 10, "") .. text
      --   end
      -- end

      local icons = require "core.icons"

      local kind_icons = icons.kind

      local opts_cmp = {
        formatting = {
          max_width_menu = 30,
          max_width_abbr = 30,
          ellipsis = icons.ui.Ellipsis,
          hl_group = "Comment",
          duplicates = {
            buffer = 1,
            path = 1,
            nvim_lsp = 0,
            luasnip = 1,
          },
        },
      }

      cmp.setup {

        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },

        formatting = {
          fields = { "kind", "abbr", "menu" },
          expandable_indicator = true,
          format = function(entry, vim_item)
            --Creating variables for forrmating
            local max_width_menu = opts_cmp.formatting.max_width_menu
            local max_width_abbr = opts_cmp.formatting.max_width_abbr
            local ellipsis = opts_cmp.formatting.ellipsis
            local menu = improved_menu(vim_item.menu, entry, "(LSP)")

            -- Set up Icons
            vim_item.kind = kind_icons[vim_item.kind]

            -- Set up hl group for cmp menu items
            vim_item.menu_hl_group = opts_cmp.formatting.hl_group

            -- Set up Menu Messages for items
            vim_item.menu = ({
              nvim_lsp = menu,
              nvim_lua = "(Lua)",
              path = "(Path)",
              buffer = "(Buffer)",
              luasnip = "(Snippet)",
              latex_symbols = "(Latex)",
            })[entry.source.name]

            -- Set up Duplicates
            ---@diagnostic disable-next-line: assign-type-mismatch
            vim_item.dup = opts_cmp.formatting.duplicates[entry.source.name] or 0

            -- Reduce width of menu items and replace excedent with ellipsis for menu and abbr fields
            vim_item.abbr = define_max_width(vim_item.abbr, max_width_abbr, ellipsis)
            vim_item.menu = define_max_width(vim_item.menu, max_width_menu, ellipsis)

            return vim_item
          end,
        },

        window = {
          ---@diagnostic disable-next-line: assign-type-mismatch
          documentation = false,
          completion = {
            border = "rounded",
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
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
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
              -- Disable LSP snippets for Java
              local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
              if kind == "Snippet" and ctx.prev_context.filetype == "java" then
                return false
              end
              local source_name = entry.source:get_debug_name()
              if source_name == "nvim_lsp:emmet_language_server" then
                return true
              end
              if kind == "Text" then
                return false
              end
              return true
            end,
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
      }
    end,

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "f3fora/cmp-spell",
    },
  },

  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find "Windows")
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function()
          -- require'luasnip'.filetype_extend("Dockerfile", {"Dockerfile.dev"})
          require("luasnip").filetype_extend("astro", { "typescript", "html" })
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
  },
}
