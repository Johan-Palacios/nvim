return {

  {
    "echasnovski/mini.bufremove",
    version = false,
    opts = {
      silent = false,
    },
    config = true,
  },

  {
    "matbme/JABS.nvim",
    opts = {
      position = { "center", "top" },
      use_devicons = true,
      width = 50,
      height = 10,
      border = "rounded",
      preview_position = "top",
      preview = {
        width = 70,
        height = 20,
        border = "rounded",
      },
      keymap = {
        close = "d",
        jump = "<space>",
        h_split = "h",
        v_split = "v",
        preview = "p",
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    config = function()
      local status_ok, bufferline = pcall(require, "bufferline")
      if not status_ok then
        return
      end

      bufferline.setup {
        options = {
          themable = true,
          numbers = "none",
          close_command = function(n)
            require("mini.bufremove").delete(n, true)
          end,
          right_mouse_command = function(n)
            require("mini.bufremove").delete(n, true)
          end,

          get_element_icon = function(element)
            local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
            local fname = vim.fn.fnamemodify(element.path, ":t")
            -- local f = require "core.functions"
            -- local icons = require "core.icons"
            local icon, hl

            if devicons_ok then
              icon, hl = devicons.get_icon(fname, element.extension)
              if icon == nil then
                icon, hl = devicons.get_icon_by_filetype(element.filetype)
              end

            --   if f.isempty(icon) then
            --     icon = icons.kind.File
            --   end
            -- else
            --   icon = ""
            --   hl = "Normal"
            end

            return icon, hl
          end,
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          icon = "▎",
          color_icons = true,
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          close_icon = "󰅖",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 30,
          max_prefix_length = 30,
          tab_size = 21,
          diagnostics = false,
          diagnostics_update_in_insert = false,
          offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = true,
          always_show_bufferline = false,
          hover = {
            enabled = true,
            delay = 10,
            reveal = { "close" },
          },
        },
      }
    end,
  },
}
