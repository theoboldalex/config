-- OPTIONS
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.winborder = "rounded"
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.swapfile = false
vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.clipboard = 'unnamed'
vim.opt.ignorecase = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 10
vim.opt.signcolumn = "no"
vim.opt.hlsearch = false
vim.opt.wildmode = 'longest:full,full'
vim.opt.splitright = true
vim.opt.confirm = true
vim.opt.grepprg = "rg -S --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"

-- KEYMAP
vim.keymap.set("n", "<leader>nf", ":find ") -- could we go plugin free?
vim.keymap.set("n", "<leader>ng", ":grep ") -- could we go plugin free?
vim.keymap.set("n", "<leader>[", ":call append(line('.')-1, '')<CR>")
vim.keymap.set("n", "<leader>]", ":call append(line('.'), '')<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "c[", ":cp<CR>zz")
vim.keymap.set("n", "c]", ":cn<CR>zz")
vim.keymap.set("n", "cx", ":ccl<CR>")
vim.keymap.set("n", "co", ":copen<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "p", '"_dP')

-- AUTOCMD
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.go", "*.lua" },
    callback = function()
        vim.lsp.buf.format()
    end
})

-- LSP
vim.diagnostic.config({ virtual_text = true })
vim.lsp.config('*', { root_markers = { ".git" } })
vim.lsp.enable({
    'lua',
    'go',
    'javascript',
    'php',
})

-- PACKAGES
vim.keymap.set("n", "<leader>up", vim.pack.update)
vim.pack.add({
    { src = "https://github.com/mellow-theme/mellow.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/b3nj5m1n/kommentary" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/Saghen/blink.cmp",               version = vim.version.range("1.*") },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

-- mellow
vim.g.mellow_bold_keywords = true
vim.g.mellow_bold_functions = true
vim.g.mellow_bold_variables = true
vim.cmd.colorscheme("mellow")

-- oil
require("oil").setup({
    columns = { "icon" },
    view_options = {
        show_hidden = true
    }
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- lualine
require('lualine').setup({
    options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
})

-- QoL
require("mini.icons").setup()
require("nvim-autopairs").setup()

-- fzf-lua
require("fzf-lua").setup({ winopts = { fullscreen = true } })
vim.keymap.set("n", "<leader>sf", require('fzf-lua').files)
vim.keymap.set("n", "<leader>sg", require('fzf-lua').live_grep)
vim.keymap.set("n", "<leader>sb", require('fzf-lua').buffers)
vim.keymap.set("n", "<leader>sh", require('fzf-lua').helptags)
vim.keymap.set("n", "<leader>gg", require('fzf-lua').git_branches)

-- blink.cmp
require("blink.cmp").setup({ fuzzy = { implementation = "lua" } })

-- vim-fugitive
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame -w<cr>")
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>Git pull<cr>")
vim.keymap.set("n", "<leader>gc", ":Git checkout ")
vim.keymap.set("n", "<leader>gs", ":0G<cr>")
vim.keymap.set("n", "g[", "<cmd>diffget //2<cr>")
vim.keymap.set("n", "g]", "<cmd>diffget //3<cr>")

-- treesitter
require("nvim-treesitter.configs").setup({
    auto_install = false,
    ignore_install = {},
    ensure_installed = {
        "lua",
        "php",
        "typescript",
        "javascript",
        "vimdoc",
        "html",
        "go",
        "blade"
    },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    modules = {},
    indent = { enable = true },
})
