-- autocmd.lua

-- auto group
vim.api.nvim_create_augroup("MyAutoCmd", {})

-- Don't auto commenting new lines
vim.api.nvim_create_autocmd("FileType", {
    group = "MyAutoCmd",
    pattern = "*",
    command = "setlocal fo-=t fo-=r fo-=o",
})
