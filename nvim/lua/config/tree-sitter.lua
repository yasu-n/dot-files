-- nvim-treesitter
-- markdown is used rust-analyzer
require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "c",
        "fish",
        "lua",
        "markdown",
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
