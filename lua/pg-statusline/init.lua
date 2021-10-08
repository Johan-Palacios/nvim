local status_ok, gl = pcall(require, "galaxyline")
if not status_ok then return end

local colors = {
    white = "#abb2bf",
    bg = "#2E2E2E",
    -- bg = '#292D38',
    yellow = "#DCDCAA",
    dark_yellow = "#D7BA7D",
    cyan = "#4EC9B0",
    green = "#608B4E",
    insertgreen = "#98C379",
    light_green = "#B5CEA8",
    string_orange = "#CE9178",
    orange = "#FF8800",
    purple = "#C586C0",
    magenta = "#D16D9E",
    grey = "#858585",
    blue = "#569CD6",
    vivid_blue = "#4FC1FF",
    light_blue = "#9CDCFE",
    red = "#D16969",
    error_red = "#F44747",
    info_yellow = "#FFCC66",
    nord_blue = "#81A1C1",
    statusline_bg = "#22262e",
    -- lightbg = "#2d3139",
    lightbg = "#21242B",
    -- lightbg2 = "#262a32",
    -- lightbg2 = "#282C34",
    lightbg2 = "#24272F",
    violet = "#8A2BE2",
    darkblue = "#00008B",
    warnyelow = "#FFA500",
    newyellow = "#E5C07B",
    infoblue = "#56B6C2",
    sintaxviolet = "#BA99F6",
    newlighbg = "#5B6477",
    newpurple = "#C678DD",
    replacecolor = "#E06C75"
}

local condition = require "galaxyline.condition"
local gls = gl.section
gl.short_line_list = {
    "NvimTree", "vista", "dbui", "packer", "tagbar", "toggleterm", "vim-plug",
    "Outline"
}
local extension = require "pg-statusline/extension"

-- 1
table.insert(gls.left, {
    ViMode = {
        provider = function()
            local mode_color = {
                n = colors.blue,
                i = colors.insertgreen,
                v = colors.newpurple,
                [""] = colors.newpurple,
                V = colors.newpurple,
                c = colors.magenta,
                no = colors.blue,
                s = colors.orange,
                S = colors.orange,
                -- [""] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.blue,
                ce = colors.blue,
                r = colors.replacecolor,
                rm = colors.replacecolor,
                ["r?"] = colors.cyan,
                ["!"] = colors.blue,
                t = colors.blue
            }
            vim.api.nvim_command("hi GalaxyViMode guifg=" ..
                                     mode_color[vim.fn.mode()])
            return "▊"
        end,
        separator_highlight = "StatusLineSeparator",
        -- separator_highlight = {colors.lightbg},
        highlight = "StatusLineNC"
        -- highlight = {colors.lightbg}
    }
})

vim.fn.getbufvar(0, "ts")
-- 2
table.insert(gls.left, {
    GitIcon = {
        provider = function() return "   " end,
        condition = condition.check_git_workspace,
        separator = "",
        -- separator_highlight = "StatusLineSeparator",
        separator_highlight = {colors.lightbg},
        highlight = {colors.orange, colors.lightbg}
    }
})
-- 3
table.insert(gls.left, {
    GitBranch = {
        provider = "GitBranch",
        condition = condition.check_git_workspace,
        separator = " ",
        -- separator_highlight = "StatusLineSeparator",
        separator_highlight = {colors.lightbg, colors.lightbg},
        -- highlight = "StatusLineNC"
        highlight = {colors.white, colors.lightbg}
    }
})

table.insert(gls.left, {
    FirstElement = {
        provider = function() return "█" end,
        highlight = {colors.lightbg, colors.lightbg2}
    }
})
-- 4
table.insert(gls.left, {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = {colors.blue, colors.lightbg}
    }
})

table.insert(gls.left, {
    FileName = {
        provider = {"FileName"},
        condition = condition.buffer_not_empty,
        highlight = {colors.white, colors.lightbg},
        separator = "  ",
        separator_highlight = {colors.lightbg, colors.lightbg2}
    }
})

table.insert(gls.left, {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "   " .. dir_name .. " "
        end,
        highlight = {colors.gray, colors.lightbg2},
        separator = " ",
        -- separator_highlight = {colors.lightbg2, colors.statusline_bg}
        separator_highlight = {colors.lightbg2}
    }
})

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then return true end
    return false
end

table.insert(gls.left, {
    DiffAdd = {
        provider = "DiffAdd",
        condition = condition.hide_in_width,
        icon = "  ",
        highlight = {colors.light_green}
    }
})

table.insert(gls.left, {
    DiffModified = {
        provider = "DiffModified",
        condition = condition.hide_in_width,
        icon = "  柳 ",
        highlight = {colors.light_blue}
    }
})

table.insert(gls.left, {
    DiffRemove = {
        provider = "DiffRemove",
        condition = condition.hide_in_width,
        icon = "  ",
        highlight = {colors.red}
    }
})

table.insert(gls.left, {
    Filler = {
        provider = function() return " " end,
        highlight = "StatusLineGitDelete"
    }
})

function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, "r"))
    local s = assert(f:read "*a")
    f:close()
    if raw then return s end
    s = string.gsub(s, "^%s+", "")
    s = string.gsub(s, "%s+$", "")
    s = string.gsub(s, "[\n\r]+", " ")
    return s
end
-- cleanup virtual env
local function env_cleanup(venv)
    if string.find(venv, "/") then
        local final_venv = venv
        for w in venv:gmatch "([^/]+)" do final_venv = w end
        venv = final_venv
    end
    return venv
end
local PythonEnv = function()
    if vim.bo.filetype == "python" then
        local venv = os.getenv "CONDA_DEFAULT_ENV"
        if venv ~= nil then
            return "🅒  (" .. env_cleanup(venv) .. ")"
        end
        venv = os.getenv "VIRTUAL_ENV"
        if venv ~= nil then return "  (" .. env_cleanup(venv) .. ")" end
        return ""
    end
    return ""
end
table.insert(gls.left, {
    VirtualEnv = {
        provider = PythonEnv,
        highlight = "StatusLineTreeSitter",
        event = "BufEnter"
    }
})

table.insert(gls.right, {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.error_red}
        -- highlight = {colors.red, colors.statusline_bg}
    }
})
table.insert(gls.right, {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        -- highlight = {colors.yellow, colors.statusline_bg}
        highlight = {colors.newyellow}
    }
})

table.insert(gls.right, {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = {colors.light_blue}
    }
})

table.insert(gls.right, {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = "  ",
        highlight = {colors.infoblue}
    }
})

table.insert(gls.right, {
    TreesitterIcon = {
        provider = function()
            if next(vim.treesitter.highlighter.active) ~= nil then
                return "   "
            end
            return ""
        end,
        separator = " ",
        separator_highlight = "StatusLineSeparator",
        highlight = "StatusLineNC"
        -- highlight = {colors.sintaxviolet}
    }
})

local get_lsp_client = function(msg)
    msg = msg or "LSP Inactive"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    local lsps = ""
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= 1 then
            -- print(client.name)
            if lsps == "" then
                -- print("first", lsps)
                lsps = client.name
            else
                -- print("more", lsps)
                lsps = lsps .. ", " .. client.name
            end
        end
    end
    if lsps == "" then
        return msg
    else
        return lsps
    end
end

table.insert(gls.right, {
    ShowLspClient = {
        provider = get_lsp_client,
        condition = function()
            local tbl = {
                ["dashboard"] = true,
                [" "] = true
            }
            if tbl[vim.bo.filetype] then return false end
            return true
        end,
        icon = "  ",
        highlight = "StatusLineNC"
    }
})

table.insert(gls.right, {
    LineInfo = {
        provider = "LineColumn",
        separator = "  ",
        separator_highlight = "StatusLineSeparator",
        highlight = "StatusLineNC"
    }
})

table.insert(gls.right, {
    PerCent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = "StatusLineSeparator",
        highlight = "StatusLineNC"
    }
})

table.insert(gls.right, {
    Tabstop = {
        provider = function()
            return "Spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") ..
                       " "
        end,
        condition = condition.hide_in_width,
        separator = " ",
        separator_highlight = "StatusLineSeparator",
        highlight = "StatusLineNC"
    }
})

table.insert(gls.right, {
    BufferType = {
        provider = "FileTypeName",
        condition = condition.hide_in_width,
        separator = " ",
        separator_highlight = "StatusLineSeparator",
        highlight = "StatusLineNC"
    }
})

table.insert(gls.right, {
    FileEncode = {
        provider = "FileEncode",
        condition = condition.hide_in_width,
        separator = " ",
        separator_highlight = "StatusLineSeparator",
        highlight = "StatusLineNC"
    }
})

table.insert(gls.right, {
    Time = {
        provider = function() return '  ' .. os.date('%H:%M') .. ' ' end,
        highlight = {colors.green, colors.gray},
        separator = ' '
    }
})

table.insert(gls.right, {
    ScrollBar = {
        provider = extension.scrollbar_instance,
        highlight = {colors.dark_yellow, colors.gray}
    }
})

table.insert(gls.right, {
    Space = {
        provider = function() return " " end,
        separator = " ",
        separator_highlight = "StatusLineSeparator",
        highlight = "StatusLineNC"
    }
})

table.insert(gls.short_line_left, {
    BufferType = {
        provider = "FileTypeName",
        separator = " ",
        separator_highlight = "StatusLineSeparator",
        highlight = "StatusLineNC"
    }
})

table.insert(gls.short_line_left, {
    SFileName = {
        provider = "SFileName",
        condition = condition.buffer_not_empty,
        highlight = "StatusLineNC"
    }
})
