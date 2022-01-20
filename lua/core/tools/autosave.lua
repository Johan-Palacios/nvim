local status_ok, save = pcall(require, "autosave")
if not status_ok then
  return
end

save.setup({
    enabled = true,
    execution_message = "Autoguardado hace: " .. vim.fn.strftime("%H:%M:%S"),
    events = {"InsertLeave"},
    conditions = {
        exists = true,
        filetype_is_not = {},
        modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 2500
})
