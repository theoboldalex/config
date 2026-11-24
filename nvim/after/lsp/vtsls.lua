-- Load the Vue TypeScript plugin so vtsls understands <script> blocks in .vue files.
-- vue_ls (from nvim-lspconfig) forwards its TypeScript requests to this client.
local vue_ls = vim.fn.exepath("vue-language-server")
local global_plugins = {}
if vue_ls ~= "" then
    table.insert(global_plugins, {
        name = "@vue/typescript-plugin",
        -- .../node_modules/@vue/language-server/bin/vue-language-server.js -> package root
        location = vim.fn.fnamemodify(vim.fn.resolve(vue_ls), ":h:h"),
        languages = { "vue" },
        configNamespace = "typescript",
    })
end

return {
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
    },
    settings = {
        vtsls = { tsserver = { globalPlugins = global_plugins } },
    },
}
