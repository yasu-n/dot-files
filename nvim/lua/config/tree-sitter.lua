-- nvim-treesitter
require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "c",
        "fish",
        "lua",
        "rust",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "zig"
    },

    sync_install = false,

    auto_install = false,

    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    additional_vim_regex_highlighting = false,
}
