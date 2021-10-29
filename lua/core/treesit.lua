local ts_config = require("nvim-treesitter.configs")

ts_config.setup({
    ensure_installed = {
        "javascript", "html", "css", "bash", "lua", "json", "python", -- "rust",
        "go"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    matchup = {
        enable = true
        -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    }
})
