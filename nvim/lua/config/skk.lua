-- skkeleton.vim

-- configure
vim.fn['skkeleton#config']({
    globalJisyo="~/.skk/SKK-JISYO.L",
    userJisyo="~/.skk/skkeleton"
})

-- keymap
vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-toggle)")
