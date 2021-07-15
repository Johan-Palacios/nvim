require("toggleterm").setup {
    size = 50,
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
    direction = "vertical",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    float_opts = {
        border = "curved",
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal"
        }
    }
    -- size = 5,
    -- hide_numbers = true,
    -- shade_filetypes = {},
    -- shading_factor = "<number>", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    -- start_in_insert = true,
    -- shade_terminals = true,
    -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
    -- persist_size = true,
    -- direction = "float",
    -- close_on_exit = true, -- close the terminal window when the process exits
    -- shell = vim.o.shell,
    -- border = "curved",
    -- float_opts = {
    --     winblend = 3,
    --     highlights = {
    --         border = "Normal",
    --         background = "Normal"
    --     }
    -- }
}

-- local M = {}
-- M.setup = function()
--     local status_ok, terminal = pcall(require, "toggleterm")
--     if not status_ok then
--         print(terminal)
--         return
--     end
--     vim.api.nvim_set_keymap(
--         "n",
--         "<leader>gg",
--         "<cmd>lua require('core.terminal')._lazygit_toggle()<CR>",
--         {noremap = true, silent = true}
--     )
--     O.plugin.which_key.mappings["gg"] = "LazyGit"
--     terminal.setup(O.plugin.terminal)
-- end
--
-- local function is_installed(exe)
--     return vim.fn.executable(exe) == 1
-- end
--
-- M._lazygit_toggle = function()
--     if is_installed "lazygit" ~= true then
--         print "Please install lazygit. Check documentation for more information"
--         return
--     end
--     local Terminal = require("toggleterm.terminal").Terminal
--     local lazygit = Terminal:new {cmd = "lazygit", hidden = true}
--     lazygit:toggle()
-- end
--
-- return M
