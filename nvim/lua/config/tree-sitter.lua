-- nvim-treesitter
require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust" },

    sync_install = false,

    auto_install = false,

    highlight = {
        enable = true,
        disable = { "bash", },
    },
    indent = {
        enable = true,
    },
    additional_vim_regex_highlighting = false,
}
