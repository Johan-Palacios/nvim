local M = {}

function M.get_word_length()
  local word = vim.fn.expand "<cword>"
  return #word
end

function M.toggle_option(option)
  local value = not vim.api.nvim_get_option_value(option, {})
  vim.opt[option] = value
  vim.notify(option .. " set to " .. tostring(value))
end

function M.toggle_tabline()
  local value = vim.api.nvim_get_option_value("showtabline", {})

  if value == 2 then
    value = 0
  else
    value = 2
  end

  vim.opt.showtabline = value

  vim.notify("showtabline" .. " set to " .. tostring(value))
end

local diagnostics_active = true
function M.toggle_diagnostics()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

function M.isempty(s)
  return s == nil or s == ""
end

function M.get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

function M.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd "q!"
      end
    end)
  else
    vim.cmd "q!"
  end
end

function M.get_hlgroup(name, fallback)
  if vim.fn.hlexists(name) == 1 then
    local hl = vim.api.nvim_get_hl_by_name(name, vim.o.termguicolors)
    if not hl["foreground"] then
      hl["foreground"] = "NONE"
    end
    if not hl["background"] then
      hl["background"] = "NONE"
    end
    hl.fg, hl.bg, hl.sp = hl.foreground, hl.background, hl.special
    hl.ctermfg, hl.ctermbg = hl.foreground, hl.background
    return hl
  end
  return fallback
end

function M.keymap_buf(mode, command, excommand, desc, bufr)
  if not desc then
    desc = ""
  end
  vim.keymap.set(mode, command, excommand, { noremap = true, silent = true, desc = desc, buffer = bufr })
end

function M.keymap(mode, command, excommand, desc)
  if not desc then
    desc = ""
  end
  vim.keymap.set(mode, command, excommand, { noremap = true, silent = true, desc = desc })
end

return M
