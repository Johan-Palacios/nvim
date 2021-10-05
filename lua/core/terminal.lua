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
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    float_opts = {
        winblend = 0, -- this value here might be the problem
        highlights = {
            border = "Normal",
            background = "Normal" -- if not try setting this to Pmenu or String and see what happens       --     background = "Normal"
        }
    }
}
