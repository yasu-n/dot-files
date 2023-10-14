-- telescope.lua
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<space>ff", telescope.find_files, {})
vim.keymap.set("n", "<space>fg", telescope.live_grep, {})
vim.keymap.set("n", "<space>fb", telescope.buffers, {})
vim.keymap.set("n", "<space>fh", telescope.help_tags, {})
