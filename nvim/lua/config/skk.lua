-- skkeleton.vim

-- configure
vim.fn['skkeleton#config']({
    globalJisyo="~/.skk/SKK-JISYO.L"
})

-- keymap
vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-toggle)")
