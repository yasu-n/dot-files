-- rust.lua
if vim.g.did_ftplugins_rust ~= nil then
    return
end
vim.g.did_ftplugins_rust = 1

vim.cmd[[packadd termdebug]]
vim.g.termdebugger = "rust-gdb"
vim.g.termdebug_wide = 160
