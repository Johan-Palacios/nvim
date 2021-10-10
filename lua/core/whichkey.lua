require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20 -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = {
        gc = "Comments"
    },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB"
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {
            min = 4,
            max = 25
        }, -- min and max height of the columns
        width = {
            min = 20,
            max = 50
        }, -- min and max width of the columns
        spacing = 4, -- spacing between columns
        align = "left" -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = {
        "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "<C>"
    }, -- hide mapping boilerplate
    show_hColorelp = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = {"j", "k"},
        v = {"j", "k"}
    }
}
local wk = require("which-key")
wk.register({
    f = {
        name = "Files ",
        f = {"<cmd>Telescope find_files<cr>", "Find Files 🔎"}, -- create a binding with label
        g = {"<cmd>Telescope live_grep<cr>", "Find Words 📖"},
        h = {"<cmd>Telescope help_tags<cr>", "Find tags 📋"}
    },
    n = {
        name = "Clean Search "
    },
    m = {
        name = "Mouse Enable/Disable "
    },
    e = {
        name = "Explorer פּ"
    },
    q = {
        name = "Close Explorer xפּ"
    },
    c = {
        name = "Comment ",
        ["$"] = {"<cmd><Plug>NERDCommenterToEOL<cr>", "NERDCommenterToEOL"},
        ["<space>"] = {
            "<cmd><Plug>NERDCommenterToggle<cr>", "NERDCommenterToggle"
        },
        A = {"<cmd><Plug>NERDCommenterAppend<cr>", "NERDCommenterAppend"},
        a = {"<cmd><Plug>NERDCommenterAltDelims<cr>", "NERDCommenterAltDelims"},
        b = {"<cmd><Plug>NERDCommenterAlignBoth<cr>", "NERDCommenterAlignBoth"},
        c = {"<cmd><Plug>NERDCommenterComment<cr>", "NERDCommenterComment"},
        i = {"<cmd><Plug>NERDCommenterInvert<cr>", "NERDCommenterInvert"},
        l = {"<cmd><Plug>NERDCommenterAlignLeft<cr>", "NERDCommenterAlignLeft"},
        m = {"<cmd><Plug>NERDCommenterMinimal<cr>", "NERDCommenterMinimal"},
        n = {"<cmd><Plug>NERDCommenterNested<cr>", "NERDCommenterNested"},
        s = {"<cmd><Plug>NERDCommenterSexy<cr>", "NERDCommenterMinimal"},
        u = {"<cmd><Plug>NERDCommenterUncomment<cr>", "NERDCommenterUncomment"},
        y = {"<cmd><Plug>NERDCommenterYank<cr>", "NERDCommenterYank"}
    },
    t = {
        name = "Terminal ",
        f = {"<cmd>ToggleTerm<cr>", "Floating Terminal"},
        v = {"<cmd>ToggleTerm direction=\"vertical\"", "Terminal Vertial"},
        h = {
            "<cmd>ToggleTerm size=10 direction=\"horizontal\"",
            "Terminal Horizontal"
        }
    },
    h = {
        name = "Gitsigns "
    },
    b = {
        name = "Buffers ",
        d = {"<cmd>bd<cr>", "Delete Buffer"}
    },
    g = {
        name = "Git Options ",
        s = {"<cmd>G<cr>", "Git"},
        m = {"<cmd><Plug>(git-messenger)<cr>", "Show git message"},
        d = {"<cmd>diffget //2", "cambios de la derecha"},
        i = {"<cmd>diffget //3", "cambios de la derecha"}

    },
    p = {
        name = "Preview ",
        o = {
            "<cmd>lua require('goto-preview').goto_preview_definition()<cr>",
            "Go to Preview"
        },
        i = {
            "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>",
            "Go to Implementation"
        },
        c = {
            "<cmd>lua require('goto-preview').close_all_win()<CR>",
            "Close Preview"
        }
    },
    l = {
        name = "LSP ",
        h = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Docs"},
        p = {
            "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
            "Go To prev Diagnostic"
        },
        n = {"<cmd>lua vim.lsp.diagnostic.goto_next()", "Go To Next Diagnostic"}
    }
}, {
    prefix = "<leader>"
})
