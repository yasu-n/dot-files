vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

--api = require "nvim-tree.api"
vim.keymap.set("n", "<space>t", ":NvimTreeToggle<cr>", {buffer = bufnr, noremap = true, silent = true, nowait = true})

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})
