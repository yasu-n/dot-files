-- init.lua
-- latest: 2023-01-05

-- global settings
vim.o.fileformats = "unix,mac,dos"
vim.o.incsearch = true
vim.o.splitright = true
vim.o.completeopt = "menuone,preview"
vim.o.wildmode = "longest,full"
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.cmdheight = 3
vim.o.secure = true

-- local to window
vim.wo.number = true
vim.wo.cursorline = true
vim.wo.cursorlineopt = "number"
vim.wo.number = true

-- local to buffer
vim.opt.matchpairs:append({ "<:>" })

-- color scheme
vim.o.termguicolors = true
--vim.cmd[[colorscheme nvim-hybrid]]
require("colors.hybrid").setup()

-- language support
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- thirdparty
require("nvim-surround").setup({
    --
})

-- load lua 
require("config.autocmd")
require("config.skk")
require("config.telescope")
require("config.tree-sitter")
require("config.nvim-tree")
require("config.terminal")
require("lsp.lspconfig")
require("lualine").setup {
    options = {
        theme = "powerline",
        globalstatus = true,
    }
}
