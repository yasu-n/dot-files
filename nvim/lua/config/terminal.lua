-- terminal.lua

-- terminal keymap
-- normal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>");
-- change window
vim.keymap.set("t", "<C-w>j", "<cmd>wincmd j<cr>", { silent = true })
vim.keymap.set("t", "<C-w>k", "<cmd>wincmd k<cr>", { silent = true })
vim.keymap.set("t", "<C-w>h", "<cmd>wincmd h<cr>", { silent = true })
vim.keymap.set("t", "<C-w>l", "<cmd>wincmd l<cr>", { silent = true })

-- user command
-- vim.api.nvim_create_user_command("Term", "split | terminal ", { nargs=0 })
-- vim.api.nvim_create_user_command("Termv", "vsplit | terminal ", { nargs=0 })

-- autocmd
-- open with insert mode
--vim.api.nvim_create_autocmd("TermOpen", {
--    pattern = "*",
--    command = "startinsert",
--})

-- no number
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber",
})

-- delete terminal buffer using exit command
--vim.api.nvim_create_autocmd("TermClose", {
--    pattern = "*",
--    command = "if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif",
--})
