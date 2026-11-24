return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
    },
    -- Neovim config: LuaJIT runtime and the `vim` API, so `vim` isn't an undefined global.
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
        },
    },
}
