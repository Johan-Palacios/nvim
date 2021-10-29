local lua_settings = {
    Lua = {
        runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';')
        },
        diagnostics = {
            globals = {'vim'}
        },
        workspace = {
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
            }
        }
    }
}

local function make_config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return {
        capabilities = capabilities,
        on_attach = on_attach
    }
end

local function setup_servers()
    require'lspinstall'.setup()
    local servers = require'lspinstall'.installed_servers()
    table.insert(servers, "clangd")
    table.insert(servers, "sourcekit")
    for _, server in pairs(servers) do
        local config = make_config()
        if server == "lua" then config.settings = lua_settings end
        if server == "sourcekit" then
            config.filetypes = {"swift", "objective-c", "objective-cpp"};
        end
        if server == "clangd" then
            config.filetypes = {"c", "cpp"};
        end

        require'lspconfig'[server].setup(config)
    end
end
setup_servers()

require'lspinstall'.post_install_hook = function()
    setup_servers()
    vim.cmd("bufdo e")
end
