-- c.lua
if vim.g.did_ftplugin_c ~= nil then
    return
end
vim.g.did_ftplugin_c = 1

vim.cmd[[packadd termdebug]]
vim.g.termdebug_wide = 160
